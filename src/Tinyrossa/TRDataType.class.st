Class {
	#name : #TRDataType,
	#superclass : #Object,
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

{ #category : #validation }
TRDataType >> validateConstant: aNumber [
	self subclassResponsibility
]
