"
`TRILBlock` represent a basic block. Each block has arbitrary number of 
precedessors and zero, one or two successors.

First successor (`successor1`) always represent a pass-through block.
It might be nil though, if block is 'terminated' (see below).
Second successor (`successor2`) represent branch target of branch instruction.
It might be nil if there's no branch in block's treetops.

A block `#isTerminated` if last treetop is either return or unconditional 
branch. In this case, no more treetops can be added. 
A block `#isClosed` if last treetop is either return or branch (regardless
whether conditional or unconditional). No more treetops can be added to
closed blocks.

"
Class {
	#name : #TRILBlock,
	#superclass : #Object,
	#instVars : [
		'name',
		'treetops',
		'precedessors',
		'successor1',
		'successor2',
		'next'
	],
	#pools : [
		'TRILOpcodes'
	],
	#category : #'Tinyrossa-IL'
}

{ #category : #'instance creation' }
TRILBlock class >> forCompilation: aTRCompilation [
	^ self forCompilation: aTRCompilation named: nil
]

{ #category : #'instance creation' }
TRILBlock class >> forCompilation: aTRCompilation named: aStringOrNil [
	^ self basicNew initializeWithCompilation: aTRCompilation name: aStringOrNil
]

{ #category : #'instance creation' }
TRILBlock class >> new [
	^ self error: 'Use #forCompilation: or #forCompilation:named:'
]

{ #category : #'adding & removing' }
TRILBlock >> add: aTRNode [
	self assert: aTRNode opcode isTreeTop description: 'Invalid node (not a treetop)'.
	self assert: self isClosed not description: 'Cannot add more treetops to closed block'.

	treetops add: aTRNode.
	aTRNode incUseCount.

	aTRNode block: self.

	(aTRNode opcode isReturn or:[ aTRNode opcode isGoto ]) ifTrue: [
		"Reset successor1 if we're returning or branching off since it 
		 is unreachable from this block."
		self setSuccessor1: nil.
	].
	aTRNode opcode isBranch ifTrue: [ 
		self setSuccessor2: aTRNode symbol block.
	].
]

{ #category : #'adding & removing' }
TRILBlock >> addPrecedessor: aTRILBlock [
	precedessors isNil ifTrue: [ 
		precedessors := Array with: aTRILBlock
	] ifFalse: [
		(precedessors includes: aTRILBlock) ifFalse: [ 
			precedessors := precedessors copyWith: aTRILBlock
		].
	].
]

{ #category : #testing }
TRILBlock >> hasSingleGoto [
	^ treetops size == 1 and:[ treetops first opcode == goto ]
]

{ #category : #initialization }
TRILBlock >> initializeWithCompilation: aTRCompilation name: aStringOrNil [
	self assert: (aStringOrNil isNil or: [ aStringOrNil isString ]).

	aStringOrNil notNil ifTrue: [ 
		name := aStringOrNil
	] ifFalse: [
		| nblocks |

		nblocks := aTRCompilation symbolManager countSymbolsByType: TRLabelSymbol.
		name := String streamContents: [:s | s nextPutAll: 'BB_'; nextPutAll: (nblocks printPaddedWith: $0 to: 3 base: 10) ].
	].
	treetops := OrderedCollection new.

	aTRCompilation symbolManager defineLabel: self.
]

{ #category : #testing }
TRILBlock >> isClosed [
	| last |

	treetops isEmpty ifTrue: [ ^ false ].
	last := treetops last.
	^ last opcode isReturn or: [ last opcode isBranch ]
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
TRILBlock >> name [
	^ name
]

{ #category : #accessing }
TRILBlock >> next [
	"Return the next block (in sense of linear order).
	 This is only valid after block linearization."

	^ next
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
TRILBlock >> removePrecedessor: aTRILBlock [
	precedessors notNil ifTrue: [ 
		precedessors copyWithout: aTRILBlock.
	].
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

	successor1 notNil ifTrue: [ 
		successor1 removePrecedessor: self.
	].
	successor1 := blockOrNil.
	successor1 notNil ifTrue: [
		successor1 addPrecedessor: self.
	]
]

{ #category : #initialization }
TRILBlock >> setSuccessor2: blockOrNil [
	self assert: (blockOrNil isNil or:[blockOrNil isTRILBlock]).

	successor2 notNil ifTrue: [ 
		successor2 removePrecedessor: self.
	].
	successor2 := blockOrNil.
	successor2 notNil ifTrue: [
		successor2 addPrecedessor: self.
	]
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
TRILBlock >> treetops [
	| bbstartNode bbendNode |

	bbstartNode := (TRILNode opcode: bbstart symbol: nil constant: nil children: nil).
	bbstartNode block: self.
	bbstartNode incUseCount.
	bbendNode := (TRILNode opcode: bbend symbol: nil constant: nil children: nil).
	bbendNode block: self.
	bbendNode incUseCount.

	^ { bbstartNode } , treetops , { bbendNode }
]
