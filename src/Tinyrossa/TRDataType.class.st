Class {
	#name : #TRDataType,
	#superclass : #Object,
	#pools : [
		'TRILOpcodeTables'
	],
	#category : #'Tinyrossa-Datatypes'
}

{ #category : #accessing }
TRDataType class >> named: aString [
	| binding |

	binding := TRDataTypes bindingOf: aString.
	binding notNil ifTrue: [
		^ binding value
	] ifFalse: [
		self error: 'No such datatype: ', aString 
	].

	"
	TRDataType named: 'Int32'
	"
]

{ #category : #queries }
TRDataType >> arithmeticOpcodeFor: arithmeticOpFlag [
	"Return opcode for peforming arithmetic operation on two values 
	 of receiver's type. 
	 `arithmeticOpFlag` specifies the kind of operation wanted as 
	 one of `Add`, `Sub`, `Mul`. `Div` or `Rem`  (see pool `TRILOpcodeProps1`).
	"        
	^ (ArithmeticOpcodes at: self) 
		at: arithmeticOpFlag ifAbsent: [ self error:'No opcode for requested arithmetic operation' ]  

	"
	Add                  := 16r00000008.
	Sub                  := 16r00000010.
	Mul                  := 16r00000020.
	Div                  := 16r00000040.
	Rem                  := 16r00000080.
	(TRDataType named: 'Int32') arithmeticOpcodeFor: 16r00000020
	(TRDataType named: 'Address') compareOpcodeFor: 16r00000008.
	(TRDataType named: 'Void') compareOpcodeFor: 16r00000008.
	"
]

{ #category : #queries }
TRDataType >> compareOpcodeFor: compareFlags [
	"Return opcode for comparing two values of receiver's type.
	 `compareFlags` specify the kind of comparison wanted as
	 bit mask of `CompareTrueIfEqual`, `CompareTrueIfGreater`,  `CompareTrueIfLess`
	 or: `CompareTrueIfUnordered` (see pool `TRILOpcodeProps3`).
	"        
	^ (CompareOpcodes at: self) 
		at: compareFlags ifAbsent: [ self error:'No opcode for requested comparison' ]

	"

	CompareTrueIfLess           := 16r00000100. 
	CompareTrueIfGreater        := 16r00000200. 
	CompareTrueIfEqual          := 16r00000400. 
	CompareTrueIfUnordered      := 16r00000800. 
	(TRDataType named: 'Int32') compareOpcodeFor: 16r00000100 | 16r00000400.
	(TRDataType named: 'Address') compareOpcodeFor: 16r00000100.
	(TRDataType named: 'Void') compareOpcodeFor: 16r00000100.
	"
]

{ #category : #queries }
TRDataType >> constOpcode [
	"Return opcode that can be used to load a constant of receiver's type"
	^ ConstOpcodes at: self

	"
	(TRDataType named:'Float') constOpcode
	"
]

{ #category : #testing }
TRDataType >> isCompatibleWith: anotherType [
	self assert: (anotherType isKindOf: TRDataType).
	^ self == anotherType
]

{ #category : #testing }
TRDataType >> isFloatingPointType [
	"return false here; to be redefined in subclass(es)"

	^ false
]

{ #category : #testing }
TRDataType >> isIntegerType [
	"Return true, if receiver is integer type (of any width)"

	^ false
]

{ #category : #testing }
TRDataType >> isVoidType [
	^ false
]

{ #category : #queries }
TRDataType >> loadOpcode [
	^ LoadOpcodes at: self

	"
	(TRDataType named:'Int32') loadOpcode
	"
]

{ #category : #accessing }
TRDataType >> name [
	self subclassResponsibility
]

{ #category : #'printing & storing' }
TRDataType >> printOn:aStream [
	"append a printed representation of the receiver to the argument, aStream"

	aStream nextPutAll:'TRDataType named: '.
	self name storeOn:aStream.
]

{ #category : #queries }
TRDataType >> sizeInBytes [
	^self subclassResponsibility 
]

{ #category : #queries }
TRDataType >> storeOpcode [
	^ StoreOpcodes at: self           

	"
	(TRDataType named:'Int32') storeOpcode
	TRILOpcodes initialize
	"
]

{ #category : #validation }
TRDataType >> validateConstant: aNumber [
	self subclassResponsibility
]
