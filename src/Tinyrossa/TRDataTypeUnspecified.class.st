Class {
	#name : #TRDataTypeUnspecified,
	#superclass : #TRDataType,
	#category : #'Tinyrossa-Datatypes'
}

{ #category : #testing }
TRDataTypeUnspecified >> isCompatibleWith: anotherType [
	^ true "Any type matches unspecified type"
]

{ #category : #testing }
TRDataTypeUnspecified >> isIntegerType [
	self shouldNotImplement
]

{ #category : #accessing }
TRDataTypeUnspecified >> name [
	^ 'Unspecified'
]

{ #category : #queries }
TRDataTypeUnspecified >> sizeInBytes [
	^self shouldNotImplement  
]

{ #category : #validation }
TRDataTypeUnspecified >> validateConstant: aNumber [
	^ self shouldNotImplement
]
