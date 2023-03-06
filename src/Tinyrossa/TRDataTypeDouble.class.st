Class {
	#name : #TRDataTypeDouble,
	#superclass : #TRDataType,
	#pools : [
		'TRILOpcodes'
	],
	#category : #'Tinyrossa-Datatypes'
}

{ #category : #testing }
TRDataTypeDouble >> isFloatingPointType [
	^ true
]

{ #category : #queries }
TRDataTypeDouble >> loadOpcode [
	^ dload
]

{ #category : #accessing }
TRDataTypeDouble >> name [
   ^ 'Double'
]

{ #category : #queries }
TRDataTypeDouble >> storeOpcode [
	^ dstore
]

{ #category : #validation }
TRDataTypeDouble >> validateConstant: aNumber [
   self assert: aNumber isFloat
]
