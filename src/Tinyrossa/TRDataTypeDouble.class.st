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

{ #category : #accessing }
TRDataTypeDouble >> name [
   ^ 'Double'
]

{ #category : #queries }
TRDataTypeDouble >> sizeInBytes [
	^8
]

{ #category : #validation }
TRDataTypeDouble >> validateConstant: aNumber [
   self assert: aNumber isFloat
]
