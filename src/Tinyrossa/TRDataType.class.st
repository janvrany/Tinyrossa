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
