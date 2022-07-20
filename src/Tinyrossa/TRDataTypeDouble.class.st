Class {
	#name : #TRDataTypeDouble,
	#superclass : #TRDataType,
	#category : #'Tinyrossa-Datatypes'
}

{ #category : #accessing }
TRDataTypeDouble >> name [
   ^ 'Double'
]

{ #category : #validation }
TRDataTypeDouble >> validateConstant: aNumber [
	"superclass TRDataType says that I am responsible to implement this method"

	^ self shouldImplement
]
