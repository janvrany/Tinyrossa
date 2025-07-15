Class {
	#name : #TyClass,
	#superclass : #Typing,
	#instVars : [
		'klass'
	],
	#category : #Typing
}

{ #category : #'instance creation' }
TyClass class >> klass: aClass [
	^ self basicNew initializeWithKlass: aClass
]

{ #category : #checks }
TyClass >> check: value [
	"Return true if `value` is of 'type' specified by receiver."

	^ value isKindOf: klass
]

{ #category : #initialization }
TyClass >> initializeWithKlass: aClass [
	self assume: aClass isBehavior.
	self assume: klass isNil.

	klass := aClass
]

{ #category : #'printing & storing' }
TyClass >> storeOn: aStream parenthesised: aBoolean [
	aStream nextPutAll: klass name
]
