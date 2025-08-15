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

{ #category : #validation }
TRDataTypeDouble >> validateConstant: aNumber [
   self assume: aNumber isFloat
]
