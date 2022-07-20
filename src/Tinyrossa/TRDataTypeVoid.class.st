Class {
	#name : #TRDataTypeVoid,
	#superclass : #TRDataType,
	#category : #'Tinyrossa-Datatypes'
}

{ #category : #accessing }
TRDataTypeVoid >> name [
	^ 'Void'
]

{ #category : #validation }
TRDataTypeVoid >> validateConstant: aNumber [
	"superclass TRDataType says that I am responsible to implement this method"

	^ self shouldImplement
]
