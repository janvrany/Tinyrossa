Class {
	#name : #TRSymbol,
	#superclass : #TRUseCounted,
	#instVars : [
		'name',
		'type'
	],
	#category : #'Tinyrossa-IL-Symbols'
}

{ #category : #conversion }
TRSymbol >> asString [
	^ name
]

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
