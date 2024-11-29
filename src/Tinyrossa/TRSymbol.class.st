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
	^ another isTRSymbol and: [ name = another name ]
]

{ #category : #conversion }
TRSymbol >> asString [
	^ name
]

{ #category : #comparing }
TRSymbol >> hash [
	^ name hash
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
