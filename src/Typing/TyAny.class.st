Class {
	#name : #TyAny,
	#superclass : #Typing,
	#classVars : [
		'Instance'
	],
	#category : #Typing
}

{ #category : #initialization }
TyAny class >> initialize [
	Instance := self basicNew
]

{ #category : #'instance creation' }
TyAny class >> instance [
	^ Instance
]

{ #category : #checks }
TyAny >> check: value [
	^ true
]

{ #category : #'printing & storing' }
TyAny >> storeOn: aStream parenthesised: aBoolean [
	aStream nextPutAll: 'TyAny instance'
]
