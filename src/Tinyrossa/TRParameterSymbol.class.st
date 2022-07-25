Class {
	#name : #TRParameterSymbol,
	#superclass : #TRSymbol,
	#instVars : [
		'index'
	],
	#category : #'Tinyrossa-IL'
}

{ #category : #'instance creation' }
TRParameterSymbol class >> name:name type:type index: index [ 
	^ self basicNew initializeWithName:name type:type index: index
]

{ #category : #accessing }
TRParameterSymbol >> index [
	^ index
]

{ #category : #initialization }
TRParameterSymbol >> initializeWithName:nameArg type:typeArg index: indexArg [
	name := nameArg.
	type := typeArg.
	index := indexArg.
]

{ #category : #testing }
TRParameterSymbol >> isTRParameterSymbol [
	^ true
]
