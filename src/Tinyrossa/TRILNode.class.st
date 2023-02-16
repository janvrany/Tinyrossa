Class {
	#name : #TRILNode,
	#superclass : #TRUseCounted,
	#instVars : [
		'opcode',
		'symbol',
		'constant',
		'children',
		'parent',
		'block'
	],
	#category : #'Tinyrossa-IL'
}

{ #category : #'instance creation' }
TRILNode class >> new [
	^ self shouldNotImplement. "Use opcode:symbol:constant:children instead"
]

{ #category : #'instance creation' }
TRILNode class >> opcode: opcodeArg constant: constantArg [
	^ self opcode: opcodeArg symbol: nil constant: constantArg children: nil
]

{ #category : #'instance creation' }
TRILNode class >> opcode: opcodeArg symbol: symbolArg [
	^ self opcode: opcodeArg symbol: symbolArg constant: nil children: nil
]

{ #category : #'instance creation' }
TRILNode class >> opcode: opcodeArg symbol: symbolArg children: childrenArg [   
	^ self opcode: opcodeArg symbol: symbolArg constant: nil children: childrenArg
]

{ #category : #'instance creation-private' }
TRILNode class >> opcode: opcodeArg symbol: symbolArg constant: constantArg children: childrenArg [
	^ self basicNew initializeWithOpcode: opcodeArg symbol: symbolArg constant: constantArg children: childrenArg
]

{ #category : #accessing }
TRILNode >> block [
	^ block
]

{ #category : #accessing }
TRILNode >> block:aTRILBlock [
	self assert: block isNil.
	block := aTRILBlock.
]

{ #category : #accessing }
TRILNode >> child1 [
	^ children first
]

{ #category : #accessing }
TRILNode >> child2 [
	^ children second
]

{ #category : #accessing }
TRILNode >> child3 [
	^ children third
]

{ #category : #accessing }
TRILNode >> children [
	^ children isNil ifTrue: [ #() ] ifFalse: [ children ]
]

{ #category : #accessing }
TRILNode >> constant [
	self assert: opcode isLoadConst.
	^ constant
]

{ #category : #'ref-counting' }
TRILNode >> decUseCount [
   super decUseCount.
   useCount == 0 ifTrue: [ 
		symbol notNil ifTrue: [ 
			symbol decUseCount.
		].
		children notEmptyOrNil ifTrue: [ 
			children do: [ :child | child decUseCount ]
		].
	].
]

{ #category : #displaying }
TRILNode >> displayOn: aStream [
	opcode name printOn: aStream.
	aStream space.
	(opcode name = 'bbstart' or: [ opcode name = 'bbend' ]) ifTrue:[
		aStream nextPut:$<.
		opcode name = 'bbend' ifTrue: [ aStream nextPut:$/ ].
		aStream nextPutAll: block name; 
				nextPut:$>.
		(opcode name = 'bbend') ifTrue: [
			(block isTerminated not and: [ block successor1 notNil and:[block next isNil]]) ifTrue: [ 
				aStream nextPutAll: '  <!-- pass through to '; nextPutAll: block successor1 name; nextPutAll: ' -->'
			].
		]
	] ifFalse: [ 
		symbol notNil ifTrue: [ 
			aStream nextPutAll: symbol name
		] ifFalse: [ 
			constant notNil ifTrue: [ 
				constant displayOn: aStream.
			].
		].
	].
]

{ #category : #'ref-counting' }
TRILNode >> incUseCount [
	super incUseCount.
	useCount == 1 ifTrue: [ 
		symbol notNil ifTrue: [ 
			symbol incUseCount.
		].
		children notEmptyOrNil ifTrue: [ 
			children do: [ :child | child incUseCount ]
		].
	].
]

{ #category : #initialization }
TRILNode >> initializeWithOpcode: opcodeArg symbol: symbolArg constant: constantArg children: childrenArg [
	opcodeArg validateConstant: constantArg.
	opcodeArg validateSymbol: symbolArg.
	opcodeArg validateChildren: childrenArg.    

	opcode := opcodeArg.
	symbol := symbolArg.
	constant := constantArg.
	children := childrenArg.

	children notEmptyOrNil ifTrue: [
		children do: [:child | child parent: self ]
	].
]

{ #category : #accessing }
TRILNode >> opcode [
	^ opcode
]

{ #category : #accessing }
TRILNode >> parent [
	^ parent
]

{ #category : #accessing }
TRILNode >> parent:aTRILNode [
	self assert: opcode isTreeTop not description: 'Cannot set parent of a treetop'.
	self assert: aTRILNode notNil description: 'Parent already set'.
	parent := aTRILNode.
	self block: parent block.
]

{ #category : #'printing & storing' }
TRILNode >> printOn:aStream [
	"append a printed representation of the receiver to the argument, aStream"

	super printOn:aStream.
	aStream nextPut:$(.
	opcode name printOn:aStream.
	(opcode name = 'bbstart' or: [ opcode name = 'bbend' ]) ifTrue:[
		aStream nextPutAll:' ('; nextPutAll: block name; nextPut:$).
	] ifFalse: [
		aStream nextPutAll:': { ... }'.
	]
]

{ #category : #rewriting }
TRILNode >> replace: oldChild with: newChild [
	| newChildren |

	self assert: children isEmptyOrNil not.
	self assert: (children includes: oldChild).

	newChildren := children copy.
	newChildren at: (children indexOf: oldChild) put: newChild.

	self opcode validateChildren: newChildren.

	children := newChildren.
	oldChild decUseCount.
	newChild incUseCount.
]

{ #category : #rewriting }
TRILNode >> replaceWith: anotherNode [
	self opcode isTreeTop ifFalse: [
		self parent replace: self with: anotherNode.
	].
	^ anotherNode.
]

{ #category : #accessing }
TRILNode >> symbol [
	self assert: (opcode hasSymbolRef or: [ opcode isBranch ]).
	^ symbol
]

{ #category : #accessing }
TRILNode >> type [
	^ opcode type
]
