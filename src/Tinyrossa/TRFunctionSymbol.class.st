Class {
	#name : #TRFunctionSymbol,
	#superclass : #TRSymbol,
	#instVars : [
		'linkageClass'
	],
	#category : #'Tinyrossa-IL-Symbols'
}

{ #category : #'instance creation' }
TRFunctionSymbol class >> name:name type:type linkage: linkageClass [ 
	^ self basicNew initializeWithName:name type:type linkage: linkageClass
]

{ #category : #initialization }
TRFunctionSymbol >> initializeWithName:nameArg type:typeArg linkage: linkageClassArg [
	name := nameArg.
	type := typeArg.
	linkageClass := linkageClassArg.
]

{ #category : #testing }
TRFunctionSymbol >> isTRFunctionSymbol [
	^ true
]

{ #category : #'accessing-config' }
TRFunctionSymbol >> linkageClass [
	^ linkageClass
]
