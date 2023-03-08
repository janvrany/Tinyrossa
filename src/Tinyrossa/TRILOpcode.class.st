Class {
	#name : #TRILOpcode,
	#superclass : #Object,
	#instVars : [
		'name',
		'type',
		'props1',
		'props2',
		'props3',
		'children',
		'swapChildrenOpcode',
		'reverseBranchOpcode',
		'booleanCompareOpcode',
		'ifCompareOpcode'
	],
	#pools : [
		'TRILOpcodeProps1',
		'TRILOpcodeProps2',
		'TRILOpcodeProps3'
	],
	#category : #'Tinyrossa-IL'
}

{ #category : #accessing }
TRILOpcode class >> named: aString [
	| binding |

	binding := TRILOpcodes bindingOf: aString.
	binding notNil ifTrue: [
		^ binding value
	] ifFalse: [
		self error: 'No such opcode: ', aString 
	].

	"
	TRILOpcode named: 'iadd'
	"
]

{ #category : #accessing }
TRILOpcode >> booleanCompareOpcode [
	^ booleanCompareOpcode
]

{ #category : #testing }
TRILOpcode >> hasChildren [
	^ children isNil or:[children notEmpty]
]

{ #category : #testing }
TRILOpcode >> hasSymbolRef [
	"
	Return true if this opcode requires symbol reference, false otherwise.
	"

	"
	In original Testarossa, indirect loads have 'shadow array symbols'.
	We do not have them in Tinyrossa so we do not mandate symbol so
	for such opcodes return `false` even if `HasSymbolRef` property is set.
	"
	(props1 bitTest: Indirect) ifTrue: [ 
		(props1 bitTest: Load | Store) ifTrue: [ 
			^ false
		].
	].
	^ props1 bitTest: HasSymbolRef
]

{ #category : #accessing }
TRILOpcode >> ifCompareOpcode [
	^ ifCompareOpcode
]

{ #category : #initialization }
TRILOpcode >> initializeFrom: anArray [
	"
	Private - initialize opcode from specification. Only to be called
	from TRILOpcodes class >> initialize!
	"
	self assert: anArray size == self class instSize.
	1 to: anArray size do: [:instIndex | 
		self instVarAt: instIndex put: (anArray at: instIndex).
	].
]

{ #category : #inspecting }
TRILOpcode >> inspectorExtraAttributes [
	^ super inspectorExtraAttributes
		at: '-props1' put: [ String streamContents:[:s | self printProps: TRILOpcodeProps1 value: props1 on: s] ];
		at: '-props2' put: [ String streamContents:[:s | self printProps: TRILOpcodeProps2 value: props2 on: s] ];
		at: '-props3' put: [ String streamContents:[:s | self printProps: TRILOpcodeProps3 value: props3 on: s] ];
		yourself
]

{ #category : #testing }
TRILOpcode >> isArithmetic [
	^ props1 bitTest: (Add | Sub | Mul | Div | Rem)
]

{ #category : #testing }
TRILOpcode >> isBranch [
	^ props1 bitTest: Branch
]

{ #category : #testing }
TRILOpcode >> isCompare [
	^ props1 bitTest: BooleanCompare
]

{ #category : #testing }
TRILOpcode >> isGoto [
	^ name = 'goto'
]

{ #category : #testing }
TRILOpcode >> isIndirect [
	^ props1 bitTest: Indirect
]

{ #category : #testing }
TRILOpcode >> isInvalid [
	^ name = 'invalid'
]

{ #category : #testing }
TRILOpcode >> isLoad [
	^ props1 bitTest: Load
]

{ #category : #testing }
TRILOpcode >> isLoadConst [
	^ props1 bitTest: LoadConst
]

{ #category : #testing }
TRILOpcode >> isReturn [
	^ props1 bitTest: Return
]

{ #category : #testing }
TRILOpcode >> isStore [
	^ props1 bitTest: Store
]

{ #category : #testing }
TRILOpcode >> isTreeTop [
	"**
	 * @brief This query must return true for any opcode that may appear at the
	 *        top of a tree (i.e., any node that a `TR::TreeTop` points to).  For
	 *        example, a store opcode would return true because it may appear under
	 *        a TR::TreeTop, even though it might also appear as a child of a NULLCHK
	 *        node in another circumstance.
	 *"
	^ props1 bitTest: TreeTop
]

{ #category : #accessing }
TRILOpcode >> name [
	^ name
]

{ #category : #'printing & storing' }
TRILOpcode >> printOn:aStream [
	"append a printed representation of the receiver to the argument, aStream"

	self class name printOn: aStream.
	aStream nextPutAll:' named: '.
	name storeOn:aStream.
]

{ #category : #'printing & storing' }
TRILOpcode >> printProps: propsPool value: propsValue on: stream [
	| printPipe |

	printPipe := false.
	propsPool classVarNames do: [:propName | 
		| propValue |

		propValue := propsPool classVarAt: propName.
		(propsValue bitAnd: propValue) ~~ 0 ifTrue: [ 
			printPipe ifTrue: [ 
				stream nextPutAll: ' | '.
			].
			printPipe := true.
			stream nextPutAll: propName.
		].
	].
]

{ #category : #accessing }
TRILOpcode >> reverseBranchOpcode [
	^ reverseBranchOpcode
]

{ #category : #accessing }
TRILOpcode >> swapChildrenOpcode [
	^ swapChildrenOpcode
]

{ #category : #accessing }
TRILOpcode >> type [
	"Return the data type this opcode produces"

	^ type
]

{ #category : #validation }
TRILOpcode >> validateChildren: aCollection [
	"Validate whether given collection contains valid child nodes
	 for this opcode. Throw an assertion error when not."

	"If `children` is nil, it means the node can have
	 any number of children of any type. For example ?call nodes."
	children notNil ifTrue:[
		self assert: aCollection size == children size description: 'Invalid number of children'.
		1 to: children size do: [ :i |
			self assert: ((children at: i) isCompatibleWith: (aCollection at: i) type) description: 'Incompatible child ' , i printString
		].
	].
]

{ #category : #validation }
TRILOpcode >> validateConstant: aNumber [
	self isLoadConst ifTrue: [
		type validateConstant: aNumber.
	] ifFalse: [ 
		self assert: aNumber isNil.
	].
]

{ #category : #validation }
TRILOpcode >> validateSymbol: aTRSymbol [
	self hasSymbolRef ifTrue: [ 
		self assert: aTRSymbol notNil.
		self assert: aTRSymbol isTRLabelSymbol not.
		^ self.
	].
	self isBranch ifTrue: [ 
		self assert: aTRSymbol notNil.
		self assert: aTRSymbol isTRLabelSymbol.
		^ self.
	].
	self assert: aTRSymbol isNil.
]
