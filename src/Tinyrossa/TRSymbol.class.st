Class {
	#name : #TRSymbol,
	#superclass : #TRUseCounted,
	#instVars : [
		'name',
		'type'
	],
	#category : #'Tinyrossa-IL-Symbols'
}

{ #category : #comparing }
TRSymbol >> = another [
	^ self class == another class
		and:[ self name = another name
		and:[ self type = another type ] ]
]

{ #category : #conversion }
TRSymbol >> asString [
	^ name
]

{ #category : #comparing }
TRSymbol >> hash [
	^ ((self class hash + name hash) hashMultiply
		+ type hash) hashMultiply
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
