Class {
	#name : #TRDataTypeAddress,
	#superclass : #TRDataType,
	#category : #'Tinyrossa-Datatypes'
}

{ #category : #testing }
TRDataTypeAddress >> isIntegerType [
	^ true
]

{ #category : #accessing }
TRDataTypeAddress >> name [
	^ 'Address'
]

{ #category : #validation }
TRDataTypeAddress >> validateConstant: aNumber [
	"  TODO: care for 32bit archs somehow"
	self assert: (aNumber between: 0 and: 16rFFFFFFFFFFFFFFFF) description: 'Invalid constant'
]
