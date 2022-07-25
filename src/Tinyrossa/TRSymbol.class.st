Class {
	#name : #TRSymbol,
	#superclass : #Object,
	#instVars : [
		'name',
		'type',
		'location'
	],
	#category : #'Tinyrossa-IL'
}

{ #category : #testing }
TRSymbol >> isTRSymbol [
	^ true
]

{ #category : #accessing }
TRSymbol >> location [
	^ location
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

{ #category : #initialization }
TRSymbol >> setLocation: registerOrMemRef [
	self assert: location isNil.
	location := registerOrMemRef.
]

{ #category : #accessing }
TRSymbol >> type [
	^ type
]
