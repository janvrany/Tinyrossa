"
`TRILBlock` represent a basic block. Each block has arbitrary number of 
precedessors and zero, one or two successors.

First successor (`successor1`) always represent a pass-through block.
It might be nil though, if block is 'terminated' (see below).
Second successor (`successor2`) represent branch target of branch instruction.
It might be nil if there's no branch in block's treetops.

A block `#isTerminated` if last treetop is either return or unconditional 
branch. In this case, no more treetops can be added. 

A block `#isBranching` if it contains 'branching' node (either branch or check
node, see `TRILNode >> #isBranch` and `#isCheck`. Each block may contain
at most one 'branching' node, but it need not be the last one.

To facilitate integration with other part of high-level virtual machine, block
contains references to 'initial' VM state (state upon entry to the block) and
'current' VM state, the state of the VM upon execution of the last node in a block).
To the block, VM state is completely transparent opaque object - it is the IR builder
who is responsible for managing states (if needed at all). See TRILBytecodeBuilder.

"
Class {
	#name : #TRILBlock,
	#superclass : #Object,
	#instVars : [
		'cfg',
		'name',
		'bbstartNode',
		'treetops',
		'bbendNode',
		'precedessors',
		'successor1',
		'successor2',
		'next',
		'startState',
		'currentState',
		'liveness'
	],
	#pools : [
		'TRILOpcodes'
	],
	#category : #'Tinyrossa-IL'
}

{ #category : #'instance creation' }
TRILBlock class >> forCFG: aTRCFG [
	^ self forCFG: aTRCFG named: nil
]

{ #category : #'instance creation' }
TRILBlock class >> forCFG: aTRCFG named: aStringOrNil [
	^ self basicNew initializeWithCFG: aTRCFG name: aStringOrNil
]

{ #category : #'instance creation' }
TRILBlock class >> new [
	^ self error: 'Use #forCFG: or #forCFG:named:'
]

{ #category : #'adding & removing' }
TRILBlock >> add: aTRNode [
	self assert: aTRNode opcode isTreeTop description: 'Invalid node (not a treetop)'.
	self assert: self isTerminated not description: 'Cannot add more treetops to closed block'.
	self assert:(aTRNode opcode isBranching not or: [ self isBranching not ]) description: 'Cannot add another branching node to block which already branches'.

	treetops add: aTRNode.
	aTRNode setBlock: self.
	aTRNode incUseCount.

	(aTRNode opcode isReturn or:[ aTRNode opcode isGoto ]) ifTrue: [
		"Reset successor1 if we're returning or branching off since it 
		 is unreachable from this block."
		self setSuccessor1: nil.
	].
	aTRNode opcode isBranching ifTrue: [ 
		self setSuccessor2: aTRNode symbol block.
	].
]

{ #category : #'adding & removing' }
TRILBlock >> addPrecedessor: aTRILBlock [
	(precedessors includes: aTRILBlock) ifFalse: [ 
			precedessors := precedessors copyWith: aTRILBlock
	].
]

{ #category : #accessing }
TRILBlock >> bbstart [
	^ bbstartNode
]

{ #category : #accessing }
TRILBlock >> cfg [
	^ cfg
]

{ #category : #accessing }
TRILBlock >> compilation [
	^cfg compilation
]

{ #category : #'accessing - VM state' }
TRILBlock >> currentState [
	^ currentState
]

{ #category : #initialization }
TRILBlock >> initializeWithCFG: aTRCFG name: aString [
	self assert: aTRCFG notNil.
	self assert: aString notNil.

	cfg := aTRCFG.
	name := aString.
	bbstartNode := (TRILNode opcode: bbstart symbol: nil constant: nil children: nil).
	bbstartNode setBlock: self.
	bbstartNode incUseCount.
	treetops := OrderedCollection new.
	bbendNode := (TRILNode opcode: bbend symbol: nil constant: nil children: nil).
	bbendNode setBlock: self.
	bbendNode incUseCount.        
	precedessors := Array new.
]

{ #category : #testing }
TRILBlock >> isBranching [
	| branching |

	branching := treetops contains: [:node | node opcode isBranching ].
	^ branching
]

{ #category : #testing }
TRILBlock >> isEmpty [
	^ treetops isEmpty
]

{ #category : #testing }
TRILBlock >> isExtension [
	"
	Return `true` if this block is an 'extension' of previous block.

	From https://github.com/eclipse/omr/blob/master/doc/compiler/il/IntroToTrees.md#basic-blocks: 

	   | and locates blocks whose only predecessor is the 
	   | previous block in program order. Such blocks are 
	   | flagged as 'extensions' of the previous block
	"
	^ precedessors size == 1 
		and: [ precedessors first successor1 == self
		and: [ precedessors first next == self ] ]
]

{ #category : #testing }
TRILBlock >> isTRILBlock [
	^ true
]

{ #category : #testing }
TRILBlock >> isTerminated [
	| last |

	treetops isEmpty ifTrue: [ ^ false ].
	last := treetops last.
	^ last opcode isReturn or: [ last opcode isGoto ]
]

{ #category : #accessing }
TRILBlock >> liveness [
	"Return this block's liveness information."

	self assert: liveness notNil description: 'Liveness not yet computed, call `TRLiveness compute: cfg` first'.

	^ liveness
]

{ #category : #accessing }
TRILBlock >> name [
	^ name
]

{ #category : #accessing }
TRILBlock >> next [
	"Return the next block (in sense of linear order).
	 This is only valid after block linearization."

	^ next
]

{ #category : #testing }
TRILBlock >> notEmpty [
	^ self isEmpty not
]

{ #category : #accessing }
TRILBlock >> precedessors [
	^ precedessors copy
]

{ #category : #enumerating }
TRILBlock >> precedessorsDo: aBlock [
	precedessors do: aBlock
]

{ #category : #'printing & storing' }
TRILBlock >> printOn:aStream [
	"append a printed representation of the receiver to the argument, aStream"

	super printOn:aStream.
	aStream nextPut:$(.
	name printOn:aStream.
	aStream nextPut:$).
]

{ #category : #'adding & removing' }
TRILBlock >> remove: aTRNode [
	self assert: (treetops includes: aTRNode).

	treetops remove: aTRNode.
	aTRNode decUseCount.
	aTRNode opcode isBranching ifTrue: [ 
		self setSuccessor2: nil
	].
]

{ #category : #'adding & removing' }
TRILBlock >> removeAll [
	treetops copy do:[:node| self remove: node].
]

{ #category : #'adding & removing' }
TRILBlock >> removePrecedessor: aTRILBlock [
	precedessors notNil ifTrue: [ 
		precedessors := precedessors copyWithout: aTRILBlock.
	].
]

{ #category : #'adding & removing' }
TRILBlock >> replace: oldNode with: newNode [

	self assert: oldNode opcode isTreeTop description: 'Invalid node (not a treetop)'.
	self assert: ((treetops includes: oldNode) or: [ bbstartNode == oldNode or:[ bbendNode == oldNode ] ]).
	self assert:((oldNode opcode isBranching == newNode opcode isBranching == true) "we're either replacing branch with branch..."
				 or:[(newNode opcode isBranching and:[ self isBranching not])       "...or we're creating branch in non-branching block..."
				 or:[ newNode opcode isBranching not ]])                           "...or we're replacing with non-branching node."
		description: 'Invalid node (block can contain at most one branching node)'.
	self assert: (bbstartNode ~~ oldNode or: [ newNode opcode == bbstart ])
		description: 'Invalid node (bbstart node can be replaced only with another bbstart node)'.
	self assert: (bbendNode ~~ oldNode or: [ newNode opcode == bbend ])
		description: 'Invalid node (bbstart node can be replaced only with another bbend node)'.

	oldNode == bbstartNode ifTrue: [
		bbstartNode := newNode.
	] ifFalse: [
	oldNode == bbendNode ifTrue: [
		bbendNode := newNode.
	] ifFalse: [
		| index |

		index := treetops indexOf: oldNode.
		self assert:(index == treetops size or: [newNode opcode isReturn not and:[ newNode opcode isGoto not]])
			description: 'Invalid node (cannot replace non-last node with return or goto)'.
		treetops at: index put: newNode.
	]].

	newNode setBlock: self.
	newNode locationIfNotSet: oldNode location.
	newNode incUseCount.
	oldNode decUseCount.
	oldNode opcode isBranching ifTrue: [ 
		self setSuccessor2: nil.
	].
	newNode opcode isBranching ifTrue: [ 
		self setSuccessor2: newNode symbol block.
	].
	(newNode opcode isReturn or:[ newNode opcode isGoto ]) ifTrue: [
		"Reset successor1 if we're returning or branching off since it 
		 is unreachable from this block."
		self setSuccessor1: nil.
	].
]

{ #category : #initialization }
TRILBlock >> setLiveness: aTRLiveness [
	"Set this block's liveness information. This is used
	 during liveness computation."

	self assert: liveness isNil.
	liveness := aTRLiveness.
]

{ #category : #initialization }
TRILBlock >> setNext: aTRILBlock [ 
	"Set next block (in sense of linear order). This is used
	 during block linearization."

	self assert: (self isTerminated or: [ successor1 == aTRILBlock ]).    
	next := aTRILBlock.
]

{ #category : #initialization }
TRILBlock >> setSuccessor1: blockOrNil [
	self assert: (blockOrNil isNil or:[blockOrNil isTRILBlock]).
	self assert: (blockOrNil isNil or:[self isTerminated not]).

	successor1 notNil ifTrue: [ 
		successor1 removePrecedessor: self.
	].
	successor1 := blockOrNil.
	successor1 notNil ifTrue: [
		successor1 addPrecedessor: self.
	]
]

{ #category : #initialization }
TRILBlock >> setSuccessor2: block [
	self assert: (block isNil or:[block isTRILBlock]).
	self assert: (block isNil or:[treetops contains:[:node | node opcode isBranching]]).

	successor2 notNil ifTrue: [ 
		successor2 removePrecedessor: self.
	].
	successor2 := block.
	successor2 notNil ifTrue: [
		successor2 addPrecedessor: self.
	]
]

{ #category : #'accessing - VM state' }
TRILBlock >> startState [
	^ startState
]

{ #category : #'accessing - VM state' }
TRILBlock >> startState: aTRVMState [
	self assert: startState isNil.
	self assert: currentState isNil.

	startState := aTRVMState.
	currentState := aTRVMState copy.
]

{ #category : #accessing }
TRILBlock >> successor1 [
	^ successor1
]

{ #category : #accessing }
TRILBlock >> successor2 [
	^ successor2
]

{ #category : #accessing }
TRILBlock >> successors [
	successor2 isNil ifTrue:[
		successor1 isNil ifTrue:[ ^#() ].
		^ { successor1 }
	].

	successor1 isNil ifTrue:[ ^ { successor2 } ].
	^ { successor1 . successor2 }
]

{ #category : #enumerating }
TRILBlock >> successorsDo: aBlock [
	successor1 notNil ifTrue: [
		aBlock value: successor1
	].
	successor2 notNil ifTrue: [
		aBlock value: successor2
	].
]

{ #category : #accessing }
TRILBlock >> treetops [
	^ { bbstartNode } , treetops , { bbendNode }
]

{ #category : #enumerating }
TRILBlock >> treetopsDo: aBlock [
	aBlock value: bbstartNode.
	treetops do: aBlock.
	aBlock value: bbendNode.
]

{ #category : #accessing }
TRILBlock >> treetopsLast [
	^ treetops last
]
