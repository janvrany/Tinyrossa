Class {
	#name : #TRDataTypeDouble,
	#superclass : #TRDataType,
	#category : #'Tinyrossa-Datatypes'
}

{ #category : #testing }
TRDataTypeDouble >> isFloatingPointType [
	^ true
]

{ #category : #accessing }
TRDataTypeDouble >> name [
   ^ 'Double'
]

{ #category : #validation }
TRDataTypeDouble >> validateConstant: aNumber [
   self assert: aNumber isFloat
]
