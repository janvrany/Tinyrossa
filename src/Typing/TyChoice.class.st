Class {
	#name : #TyChoice,
	#superclass : #Typing,
	#instVars : [
		'option1',
		'option2'
	],
	#category : #Typing
}

{ #category : #'instance creation' }
TyChoice class >> option1: option1 option2: option2 [
	^ self basicNew initializeWithOption1: option1 option2: option2
]

{ #category : #checks }
TyChoice >> check: value [
	^ (option1 check: value) or: [ option2 check: value ]
]

{ #category : #initialization }
TyChoice >> initializeWithOption1: option1Arg option2: option2Arg [
	self assume: (option1Arg isKindOf: Typing).
	self assume: (option2Arg isKindOf: Typing).

	option1 := option1Arg.
	option2 := option2Arg.
]

{ #category : #testing }
TyChoice >> isChoice [
	^ true
]

{ #category : #'printing & storing' }
TyChoice >> storeOn: aStream parenthesised: aBoolean [
	aBoolean ifTrue: [ aStream nextPut:$( ].
	option1 storeOn: aStream parenthesised: (option1 isChoice not).
	aStream nextPutAll: ' | '.
	option2 storeOn: aStream parenthesised: true.
	aBoolean ifTrue: [ aStream nextPut:$) ].
]

{ #category : #'instance creation' }
TyChoice >> | typeishOrRefinement [
	typeishOrRefinement isBlock ifTrue: [
		self error: 'Cannot refine choice (union). Refine individual options!'.
		^ nil.
	] ifFalse: [
		^ TyChoice option1: self option2: typeishOrRefinement asTyping
	].
]
