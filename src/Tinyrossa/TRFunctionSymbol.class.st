Class {
	#name : #TRFunctionSymbol,
	#superclass : #TRStaticSymbol,
	#instVars : [
		'linkageClass'
	],
	#pools : [
		'TRIntLimits'
	],
	#category : #'Tinyrossa-IL-Symbols'
}

{ #category : #'instance creation' }
TRFunctionSymbol class >> name: name type: type [
	^ self shouldNotImplement "Use #name:type:linkage: instead"
]

{ #category : #'instance creation' }
TRFunctionSymbol class >> name:name type:type linkage: linkageClass [
	^ self basicNew initializeWithName:name type:type linkage: linkageClass
]

{ #category : #'instance creation' }
TRFunctionSymbol class >> new [
	^ self shouldNotImplement "Use #name:type:linkage: instead"
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
