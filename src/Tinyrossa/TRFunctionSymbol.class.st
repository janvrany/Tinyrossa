Class {
	#name : #TRFunctionSymbol,
	#superclass : #TRSymbol,
	#instVars : [
		'linkageClass',
		'parameters',
		'address'
	],
	#pools : [
		'TRIntLimits'
	],
	#category : #'Tinyrossa-IL-Symbols'
}

{ #category : #'instance creation' }
TRFunctionSymbol class >> name:name type:type linkage: linkageClass [ 
	^ self basicNew initializeWithName:name type:type linkage: linkageClass
]

{ #category : #accessing }
TRFunctionSymbol >> address [
	"Return the address of this function or `nil` is address is not
	 (yet) known."
	
	^address
]

{ #category : #converting }
TRFunctionSymbol >> asAcDSLOperand [
	^ AcDSLSymbol value: name
]

{ #category : #converting }
TRFunctionSymbol >> asAcDSLOperandList [
	^ self asAcDSLOperand asAcDSLOperandList
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

{ #category : #initialization }
TRFunctionSymbol >> setAddress: anInteger [
	self assert: anInteger isInteger.
	self assert:(anInteger between: 0 and: 16rFFFFFFFFFFFFFFFF).
	self assert: address isNil.
	
	address := anInteger.
]
