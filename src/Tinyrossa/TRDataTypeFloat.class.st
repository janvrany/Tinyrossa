Class {
	#name : #TRDataTypeFloat,
	#superclass : #TRDataType,
	#category : #'Tinyrossa-Datatypes'
}

{ #category : #testing }
TRDataTypeFloat >> isFloatingPointType [
	^ true
]

{ #category : #accessing }
TRDataTypeFloat >> name [
	^ 'Float'
]

{ #category : #validation }
TRDataTypeFloat >> validateConstant: aNumber [
	self assert: aNumber isFloat
]
