Class {
	#name : #TyRefined,
	#superclass : #Typing,
	#instVars : [
		'base',
		'refinement'
	],
	#category : #Typing
}

{ #category : #'instance creation' }
TyRefined class >> base: base refinement: refinement [
	^ self basicNew initializeWithBase: base refinement: refinement
]

{ #category : #checks }
TyRefined >> check: value [
	^ (base check: value) and: [ (refinement value: value) == true ]
]

{ #category : #initialization }
TyRefined >> initializeWithBase: baseTyping refinement: refinementBlock [
	self assume: (baseTyping isKindOf: Typing).
	self assume: (refinementBlock respondsTo: #value:).
	self assume: (refinementBlock respondsTo: #argumentCount).
	self assume: (refinementBlock argumentCount == 1).

	base := baseTyping.
	refinement := refinementBlock.
]
