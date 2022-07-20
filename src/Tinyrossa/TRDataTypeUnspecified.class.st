Class {
	#name : #TRDataTypeUnspecified,
	#superclass : #TRDataType,
	#category : #'Tinyrossa-Datatypes'
}

{ #category : #testing }
TRDataTypeUnspecified >> isCompatibleWith: anotherType [
	^ true "Any type matches unspecified type"
]

{ #category : #accessing }
TRDataTypeUnspecified >> name [
	^ 'Unspecified'
]

{ #category : #validation }
TRDataTypeUnspecified >> validateConstant: aNumber [
	^ self shouldNotImplement
]
