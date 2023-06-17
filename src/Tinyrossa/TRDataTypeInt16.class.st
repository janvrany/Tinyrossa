Class {
	#name : #TRDataTypeInt16,
	#superclass : #TRDataType,
	#pools : [
		'TRILOpcodes'
	],
	#category : #'Tinyrossa-Datatypes'
}

{ #category : #testing }
TRDataTypeInt16 >> isIntegerType [
	^ true
]

{ #category : #accessing }
TRDataTypeInt16 >> name [
	^ 'Int16'
]

{ #category : #validation }
TRDataTypeInt16 >> validateConstant: aNumber [
	self assert: (aNumber between: -16r8000 and: 16r7FFF) description: 'Invalid constant'
]
