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
TRILNode class >> opcode: opcode arguments: arguments [
	"Create a new node with given opcode and arguments.
	 Not to be used directly, use TRILBuilder instead."

	^ self new initializeWithOpcode: opcode arguments: arguments
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
TRILNode >> initializeWithOpcode: opcodeArg arguments: arguments [
	opcode := opcodeArg.

	opcode isLoadConst ifTrue: [ 
		self assert: arguments isCollection not description: 'Invalid arguments'.
		opcode validateConstant: arguments.
		constant := arguments.
	] ifFalse: [  
		self assert: arguments isCollection description: 'Invalid arguments'.
		opcode validateChildren: arguments.
		children := arguments.
		children do: [:each | each parent: self ]
	].

	self assert: (constant isNil or: [ symbol isNil ])
		description: 'Node cannot have both a constant and a symbol'.
	self assert: (constant isNil or: [ children isEmptyOrNil ])
		description: 'Node cannot have both constant and children'.
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
