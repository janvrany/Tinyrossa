Class {
	#name : #TRDataTypeInt8,
	#superclass : #TRDataType,
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
	"superclass TRDataType says that I am responsible to implement this method"

	^ self shouldImplement
]
