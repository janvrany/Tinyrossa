Class {
	#name : #TRDataTypeInt16,
	#superclass : #TRDataType,
	#category : #'Tinyrossa-Datatypes'
}

{ #category : #accessing }
TRDataTypeInt16 >> name [
	^ 'Int16'
]

{ #category : #validation }
TRDataTypeInt16 >> validateConstant: aNumber [
	"superclass TRDataType says that I am responsible to implement this method"

	^ self shouldImplement
]
