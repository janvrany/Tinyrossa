Class {
	#name : #Typing,
	#superclass : #Object,
	#category : #Typing
}

{ #category : #'instance creation' }
Typing class >> new [
	^ self shouldNotImplement. "Use parametrized instance creation"
]

{ #category : #conversion }
Typing >> asTyping [
	^ self
]

{ #category : #checks }
Typing >> check: value [
	"Return true if `value` is of 'type' specified by receiver."

	^ self subclassResponsibility.
]

{ #category : #testing }
Typing >> isChoice [
	^ false
]

{ #category : #'printing & storing' }
Typing >> printOn: aStream [
	self storeOn: aStream
]

{ #category : #'printing & storing' }
Typing >> storeOn: aStream [
	self storeOn: aStream parenthesised: false
]

{ #category : #'printing & storing' }
Typing >> storeOn: aStream parenthesised: aBoolean [
	self subclassResponsibility
]

{ #category : #'instance creation' }
Typing >> | typeishOrRefinement [
	typeishOrRefinement isBlock ifTrue: [
		^ TyRefined base: self refinement: typeishOrRefinement
	] ifFalse: [
		^ TyChoice option1: self option2: typeishOrRefinement asTyping
	].
]
