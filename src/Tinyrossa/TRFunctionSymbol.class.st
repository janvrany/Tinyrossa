Class {
	#name : #TRFunctionSymbol,
	#superclass : #TRSymbol,
	#instVars : [
		'linkageClass',
		'parameters'
	],
	#category : #'Tinyrossa-IL-Symbols'
}

{ #category : #'instance creation' }
TRFunctionSymbol class >> name:name type:type linkage: linkageClass [ 
	^ self basicNew initializeWithName:name type:type linkage: linkageClass
]

{ #category : #converting }
TRFunctionSymbol >> asAcDSLOperand [
	^ AcDSLSymbol value: name
]

{ #category : #initialization }
TRFunctionSymbol >> initializeWithName:nameArg type:typeArg linkage: linkageClassArg [
	name := nameArg.
	type := typeArg.
	linkageClass := linkageClassArg.
	parameters := OrderedCollection new.
]

{ #category : #testing }
TRFunctionSymbol >> isTRFunctionSymbol [
	^ true
]

{ #category : #'accessing-config' }
TRFunctionSymbol >> linkageClass [
	^ linkageClass
]
