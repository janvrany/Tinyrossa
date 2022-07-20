Class {
	#name : #TRDataTypeInt32,
	#superclass : #TRDataType,
	#category : #'Tinyrossa-Datatypes'
}

{ #category : #accessing }
TRDataTypeInt32 >> name [
   ^ 'Int32'
]

{ #category : #validation }
TRDataTypeInt32 >> validateConstant: aNumber [
	self assert: (aNumber between: -16r80000000 and: 16r7FFFFFFF) description: 'Invalid constant'
]
