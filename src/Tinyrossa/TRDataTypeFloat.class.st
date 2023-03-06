Class {
	#name : #TRDataTypeFloat,
	#superclass : #TRDataType,
	#pools : [
		'TRILOpcodes'
	],
	#category : #'Tinyrossa-Datatypes'
}

{ #category : #testing }
TRDataTypeFloat >> isFloatingPointType [
	^ true
]

{ #category : #queries }
TRDataTypeFloat >> loadOpcode [
	^ fload
]

{ #category : #accessing }
TRDataTypeFloat >> name [
	^ 'Float'
]

{ #category : #queries }
TRDataTypeFloat >> storeOpcode [
	^ fstore
]

{ #category : #validation }
TRDataTypeFloat >> validateConstant: aNumber [
	self assert: aNumber isFloat
]
