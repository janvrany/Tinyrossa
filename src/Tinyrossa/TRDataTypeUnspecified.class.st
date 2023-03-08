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

{ #category : #queries }
TRDataTypeUnspecified >> loadOpcode [
	^ self error: 'Do not know how to load an unspecified type!'
]

{ #category : #accessing }
TRDataTypeUnspecified >> name [
	^ 'Unspecified'
]

{ #category : #queries }
TRDataTypeUnspecified >> storeOpcode [
	^ self error: 'Do not know how to store an unspecified type!'
]

{ #category : #validation }
TRDataTypeUnspecified >> validateConstant: aNumber [
	^ self shouldNotImplement
]
