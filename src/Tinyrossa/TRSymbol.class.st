Class {
	#name : #TRSymbol,
	#superclass : #Object,
	#instVars : [
		'name',
		'type'
	],
	#category : #'Tinyrossa-IL-Symbols'
}

{ #category : #testing }
TRSymbol >> isTRSymbol [
	^ true
]

{ #category : #accessing }
TRSymbol >> name [
	^ name
]

{ #category : #'printing & storing' }
TRSymbol >> printOn:aStream [
	super printOn:aStream.
	aStream nextPut: $(.
	name storeOn: aStream.
	aStream nextPutAll: ' : '.
	aStream nextPutAll: type name.
	aStream nextPut: $).
]

{ #category : #accessing }
TRSymbol >> type [
	^ type
]
