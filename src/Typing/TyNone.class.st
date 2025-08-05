Class {
	#name : #TyNone,
	#superclass : #Typing,
	#classVars : [
		'Instance'
	],
	#category : #Typing
}

{ #category : #initialization }
TyNone class >> initialize [
	Instance := self basicNew
]

{ #category : #'instance creation' }
TyNone class >> instance [
	^ Instance
]

{ #category : #checks }
TyNone >> check: value [
	^ value isNil
]

{ #category : #'printing & storing' }
TyNone >> storeOn: aStream parenthesised: aBoolean [
	aStream nextPutAll: 'nil'
]
