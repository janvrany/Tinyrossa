Class {
	#name : #TRDataTypeFloat,
	#superclass : #TRDataType,
	#category : #'Tinyrossa-Datatypes'
}

{ #category : #accessing }
TRDataTypeFloat >> name [
	^ 'Float'
]

{ #category : #validation }
TRDataTypeFloat >> validateConstant: aNumber [
	"superclass TRDataType says that I am responsible to implement this method"

	^ self shouldImplement
]
