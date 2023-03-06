Class {
	#name : #TRDataTypeAddress,
	#superclass : #TRDataType,
	#pools : [
		'TRILOpcodes'
	],
	#category : #'Tinyrossa-Datatypes'
}

{ #category : #testing }
TRDataTypeAddress >> isIntegerType [
	^ true
]

{ #category : #queries }
TRDataTypeAddress >> loadOpcode [
	^ aload
]

{ #category : #accessing }
TRDataTypeAddress >> name [
	^ 'Address'
]

{ #category : #queries }
TRDataTypeAddress >> storeOpcode [
	^ astore
]

{ #category : #validation }
TRDataTypeAddress >> validateConstant: aNumber [
	"  TODO: care for 32bit archs somehow"
	self assert: (aNumber between: 0 and: 16rFFFFFFFFFFFFFFFF) description: 'Invalid constant'
]
