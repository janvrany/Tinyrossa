Class {
	#name : #TRILNode,
	#superclass : #Object,
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
	^ children ? #()
]

{ #category : #accessing }
TRILNode >> constant [
	self assert: opcode isLoadConst.
	^ constant
]

{ #category : #initialization }
TRILNode >> initializeWithOpcode: opcodeArg symbol: symbolArg constant: constantArg children: childrenArg [
	self assert: (symbolArg isNil or:[symbolArg isTRSymbol]).
	self assert: (constantArg isNil or:[constantArg isNumber]).
	self assert: (constantArg isNil or: [ symbolArg isNil ])
		description: 'Node cannot have both a constant and a symbol'.
	self assert: (constantArg isNil or: [ childrenArg isEmptyOrNil ])
		description: 'Node cannot have both constant and children'.

	opcode := opcodeArg.
	symbol := symbolArg.
	constant := constantArg.
	children := childrenArg.
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
TRILNode >> replace: childNode with: anotherNode [
	| newChildren |

	self assert: children notEmptyOrNil.
	self assert: (children includes: childNode).

	newChildren := children copy.
	newChildren at: (children indexOf: childNode) put: anotherNode.

	self opcode validateChildren: newChildren.

	children := newChildren.
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
