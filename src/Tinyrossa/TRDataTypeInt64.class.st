Class {
	#name : #TRDataTypeInt64,
	#superclass : #TRDataType,
	#category : #'Tinyrossa-Datatypes'
}

{ #category : #accessing }
TRDataTypeInt64 >> name [
	^ 'Int64'
]

{ #category : #validation }
TRDataTypeInt64 >> validateConstant: aNumber [
	"superclass TRDataType says that I am responsible to implement this method"

	^ self shouldImplement
]
