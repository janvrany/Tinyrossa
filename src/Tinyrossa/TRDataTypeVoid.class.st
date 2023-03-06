Class {
	#name : #TRDataTypeVoid,
	#superclass : #TRDataType,
	#category : #'Tinyrossa-Datatypes'
}

{ #category : #testing }
TRDataTypeVoid >> isVoidType [
	^ true
]

{ #category : #queries }
TRDataTypeVoid >> loadOpcode [
	^ self error: 'Cannot load void!'
]

{ #category : #accessing }
TRDataTypeVoid >> name [
	^ 'Void'
]

{ #category : #queries }
TRDataTypeVoid >> storeOpcode [
	^ self error: 'Cannot store void!'
]

{ #category : #validation }
TRDataTypeVoid >> validateConstant: aNumber [
   self assert: false
]
