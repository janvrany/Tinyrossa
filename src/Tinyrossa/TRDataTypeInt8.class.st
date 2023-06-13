Class {
	#name : #TRDataTypeInt8,
	#superclass : #TRDataType,
	#pools : [
		'TRILOpcodes'
	],
	#category : #'Tinyrossa-Datatypes'
}

{ #category : #testing }
TRDataTypeInt8 >> isIntegerType [
	^ true
]

{ #category : #accessing }
TRDataTypeInt8 >> name [
   ^ 'Int8'
]

{ #category : #validation }
TRDataTypeInt8 >> validateConstant: aNumber [
	self assert: (aNumber between: -16r80 and: 16r7F) description: 'Invalid constant'
]
