Class {
	#name : #TRDataTypeInt64,
	#superclass : #TRDataType,
	#pools : [
		'TRILOpcodes'
	],
	#category : #'Tinyrossa-Datatypes'
}

{ #category : #testing }
TRDataTypeInt64 >> isIntegerType [
	^ true
]

{ #category : #queries }
TRDataTypeInt64 >> loadOpcode [
	^ lload
]

{ #category : #accessing }
TRDataTypeInt64 >> name [
	^ 'Int64'
]

{ #category : #queries }
TRDataTypeInt64 >> storeOpcode [
	^ lstore
]

{ #category : #validation }
TRDataTypeInt64 >> validateConstant: aNumber [
	self assert: (aNumber between: -16r8000000000000000 and: 16r7FFFFFFFFFFFFFFF) description: 'Invalid constant'
]
