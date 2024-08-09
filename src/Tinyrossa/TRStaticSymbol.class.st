"
Static symbols represent data stored on the heap (as opposed to data
stored in frame which are represented by `TRRegisterMappedSymbol`s)
and therefore have a single unique absolute address.

The address however may not be known in advance so code individual code
generators must always generate proper relocations when accessing static symbols.

Jump labels and functions are special kind of static symbols.

NOTE: The name 'static' may not be best, maybe something like 'global'
or 'relocatable' would be a better fit, but we choose to stick with
'static' as it is what Testarossa calls it.

"
Class {
	#name : #TRStaticSymbol,
	#superclass : #TRSymbol,
	#instVars : [
		'address'
	],
	#pools : [
		'TRDataTypes',
		'TRIntLimits'
	],
	#category : #'Tinyrossa-IL-Symbols'
}

{ #category : #'instance creation' }
TRStaticSymbol class >> name:name type:type [
	^ self basicNew initializeWithName:name type:type
]

{ #category : #'instance creation' }
TRStaticSymbol class >> new [
	^ self shouldNotImplement "Use #name:type: instead"
]

{ #category : #accessing }
TRStaticSymbol >> address [
	"Return the address of this function or `nil` is address is not
	 (yet) known."

	^address
]

{ #category : #converting }
TRStaticSymbol >> asAcDSLOperand [
	^ AcDSLSymbol value: name
]

{ #category : #conversion }
TRStaticSymbol >> got [
	"Return the GOT entry for this symbol as another symbol"
	^ TRStaticSymbol name: name , '@got' type: Address
]

{ #category : #initialization }
TRStaticSymbol >> initializeWithName:nameArg type:typeArg [
	name := nameArg.
	type := typeArg.
]

{ #category : #testing }
TRStaticSymbol >> isTRStaticSymbol [
	^ true
]

{ #category : #initialization }
TRStaticSymbol >> setAddress: anInteger [
	self assert: anInteger isInteger.
	self assert:(anInteger between: 0 and: 16rFFFFFFFFFFFFFFFF).
	self assert: address isNil.

	address := anInteger.
]
