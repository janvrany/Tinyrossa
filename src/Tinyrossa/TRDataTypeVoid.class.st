Class {
	#name : #TRDataTypeVoid,
	#superclass : #TRDataType,
	#category : #'Tinyrossa-Datatypes'
}

{ #category : #testing }
TRDataTypeVoid >> isVoidType [
	^ true
]

{ #category : #accessing }
TRDataTypeVoid >> name [
	^ 'Void'
]

{ #category : #validation }
TRDataTypeVoid >> validateConstant: aNumber [
   self assert: false
]
