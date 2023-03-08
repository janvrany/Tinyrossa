Class {
	#name : #TRDataTypeInt32,
	#superclass : #TRDataType,
	#pools : [
		'TRILOpcodes'
	],
	#category : #'Tinyrossa-Datatypes'
}

{ #category : #testing }
TRDataTypeInt32 >> isIntegerType [
	^ true
]

{ #category : #queries }
TRDataTypeInt32 >> loadOpcode [
	^ iload
]

{ #category : #accessing }
TRDataTypeInt32 >> name [
   ^ 'Int32'
]

{ #category : #queries }
TRDataTypeInt32 >> storeOpcode [
	^ istore
]

{ #category : #validation }
TRDataTypeInt32 >> validateConstant: aNumber [
	self assert: (aNumber between: -16r80000000 and: 16r7FFFFFFF) description: 'Invalid constant'
]
