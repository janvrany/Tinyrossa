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

{ #category : #queries }
TRDataTypeInt16 >> loadOpcode [
	^ sload
]

{ #category : #accessing }
TRDataTypeInt16 >> name [
	^ 'Int16'
]

{ #category : #queries }
TRDataTypeInt16 >> storeOpcode [
	^ sstore
]

{ #category : #validation }
TRDataTypeInt16 >> validateConstant: aNumber [
	self assert: (aNumber between: -16r8000 and: 16r7FFF) description: 'Invalid constant'
]
