Class {
	#name : #TRILNode,
	#superclass : #Object,
	#instVars : [
		'opcode',
		'symbol',
		'constant',
		'children',
		'parent'
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
	self assert: parent isNil.
	self assert: aTRILNode notNil.
	parent := aTRILNode.
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
	self assert: opcode hasSymbolRef.
	^ symbol
]

{ #category : #accessing }
TRILNode >> type [
	^ opcode type
]
