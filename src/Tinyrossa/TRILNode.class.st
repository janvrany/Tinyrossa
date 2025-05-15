Class {
	#name : #TRILNode,
	#superclass : #TRUseCounted,
	#instVars : [
		'id',
		'opcode',
		'symbol',
		'constant',
		'children',
		'location',
		'block',
		'result',
		'register'
	],
	#pools : [
		'TRDataTypes',
		'TRRegisterKinds'
	],
	#category : #'Tinyrossa-IL'
}

{ #category : #'instance creation' }
TRILNode class >> new [
	^ self shouldNotImplement. "Use opcode:symbol:constant:children instead"
]

{ #category : #'instance creation' }
TRILNode class >> opcode: opcodeArg [
	^ self opcode: opcodeArg symbol: nil constant: nil register: nil children: nil
]

{ #category : #'instance creation' }
TRILNode class >> opcode: opcodeArg children: childrenArg [   
	^ self opcode: opcodeArg symbol: nil constant: nil register: nil children: childrenArg
]

{ #category : #'instance creation' }
TRILNode class >> opcode: opcodeArg constant: constantArg [
	^ self opcode: opcodeArg symbol: nil constant: constantArg register: nil children: nil
]

{ #category : #'instance creation' }
TRILNode class >> opcode: opcodeArg register: registerArg [
	^ self opcode: opcodeArg symbol: nil constant: nil register: registerArg children: nil.
]

{ #category : #'instance creation' }
TRILNode class >> opcode: opcodeArg symbol: symbolArg [
	^ self opcode: opcodeArg symbol: symbolArg constant: nil register: nil children: nil
]

{ #category : #'instance creation' }
TRILNode class >> opcode: opcodeArg symbol: symbolArg children: childrenArg [   
	^ self opcode: opcodeArg symbol: symbolArg constant: nil register: nil children: childrenArg
]

{ #category : #'instance creation-private' }
TRILNode class >> opcode: opcodeArg symbol: symbolArg constant: constantArg register: registerArg children: childrenArg [
	^ self basicNew initializeWithOpcode: opcodeArg symbol: symbolArg constant: constantArg register: registerArg children: childrenArg
]

{ #category : #accessing }
TRILNode >> block [
	^ block
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
	   block := nil.
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
	TRILNodePrinter new print: self on: aStream
]

{ #category : #accessing }
TRILNode >> id [
	^ id
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
TRILNode >> initializeWithOpcode: opcodeArg symbol: symbolArg constant: constantArg register: registerArg children: childrenArg [
	opcodeArg validateConstant: constantArg.
	opcodeArg validateSymbol: symbolArg.
	opcodeArg validateRegister: registerArg.
	opcodeArg validateChildren: childrenArg.    


	location := nil.
	opcode := opcodeArg.
	symbol := symbolArg.
	constant := constantArg.
	register:= registerArg.
	children := childrenArg.
]

{ #category : #testing }
TRILNode >> isTRILNode [
	^true
]

{ #category : #accessing }
TRILNode >> location [
	^ location
]

{ #category : #accessing }
TRILNode >> location: aTRLocation [
	self assert: (aTRLocation isTRLocation or: [ aTRLocation isNil ]).

	(location notNil and: [ aTRLocation isNil ]) ifTrue: [ self halt ].

	location := aTRLocation.
]

{ #category : #accessing }
TRILNode >> locationIfNotSet: aTRLocation [
	"Set location if this node if no location is already set. 
	 Otherwise, no-op."
	
	location isNil ifTrue:[
		self location: aTRLocation 
	]
	
]

{ #category : #testing }
TRILNode >> mayHaveSideeffect [
	"Return `true` if evaluation of this node (or any of its chilren) 
	 may have some sideeffect - modify state or change control flow."
	
	^opcode mayHaveSideeffect 
		or:[children notNil and:[children anySatisfy:[:child|child mayHaveSideeffect]]]
	
	
]

{ #category : #accessing }
TRILNode >> opcode [
	^ opcode
]

{ #category : #enumerating }
TRILNode >> postorderDo: aBlock [
	 "Traverse the node evaluate `aBlock` for each node in post-order 
	  manner."

	children notNil ifTrue: [ 
		children do: [:each | each postorderDo: aBlock ]
	].
	aBlock value: self.
]

{ #category : #enumerating }
TRILNode >> preorderDo: aBlock [
	 "Traverse the node evaluate `aBlock` for each node in pre-order 
	  manner."

	aBlock value: self.
	children notNil ifTrue: [ 
		children do: [:each | each preorderDo: aBlock ]
	].
]

{ #category : #'printing & storing' }
TRILNode >> printOn:aStream [
	"append a printed representation of the receiver to the argument, aStream"

	super printOn:aStream.
	aStream nextPut:$(.
	id isNil ifTrue:[
		aStream nextPutAll:'FREE'
	] ifFalse:[
		aStream nextPut:$N.
		aStream nextPutAll: (id printPaddedWith: $0 to: 3 base: 10).
	].
	aStream space.
	aStream nextPutAll: opcode name.
	(opcode name = 'bbstart' or: [ opcode name = 'bbend' ]) ifTrue:[
		aStream nextPutAll:' <'; nextPutAll: block name; nextPut:$>.
	].
	aStream nextPut:$).
]

{ #category : #accessing }
TRILNode >> register [
	self assert: (opcode isLoadReg or: [ opcode isStoreReg ]).

	^ register
]

{ #category : #rewriting }
TRILNode >> replace: oldChild with: newChild [
	| newChildren |

	self assert: children notEmptyOrNil.
	self assert: (children includes: oldChild).

	newChildren := children copy.
	newChildren at: (children indexOf: oldChild) put: newChild.

	self opcode validateChildren: newChildren.

	children := newChildren.
	newChild setBlock: oldChild block.
	newChild locationIfNotSet: oldChild location.
	newChild incUseCount.
	oldChild decUseCount.
]

{ #category : #accessing }
TRILNode >> result [
	"Return (virtual) register holding result of this
	 node (if it has been evaluated already)."
	^ result
]

{ #category : #initialization }
TRILNode >> setBlock: aTRILBlock [
	self assert: aTRILBlock isTRILBlock.

	block isNil ifTrue: [
		block := aTRILBlock.
		children notEmptyOrNil ifTrue:[ 
			children do: [:child | child setBlock: aTRILBlock ]
		].
		id := block compilation nodeIdFor: self.
	] ifFalse: [ 
		self assert: block == aTRILBlock description: 'Nodes cannot be reused across multiple blocks'
	].
]

{ #category : #initialization }
TRILNode >> setResult: vreg [
	opcode type == Void ifTrue: [ 
		self assert: vreg isNil description: 'Attempting to set result for void-typed node'.
		^ self.
	].
	opcode isTreeTop ifTrue: [ 
		self assert: vreg isNil description: 'Attempting to set result of tree-top'.
		^ self.
	].
	opcode type isIntegerType ifTrue: [ 
		self assert: vreg notNil.
		self assert: vreg kind == GPR
	] ifFalse: [ 
		self assert: vreg notNil.
		self assert: vreg kind == FPR
	].
	self assert: result isNil description: 'Node already evaluated!'.
	vreg setAssigned.
	result := vreg.
]

{ #category : #accessing }
TRILNode >> symbol [
	self assert: (opcode hasSymbolRef or: [ opcode isBranching ]).
	^ symbol
]

{ #category : #accessing }
TRILNode >> type [
	^ opcode type
]
