"
RegisterMappedSymbols are those that may reside in a register.

TODO: Concept doesn't have the best name, and should likely be renamed

"
Class {
	#name : #TRRegisterMappedSymbol,
	#superclass : #TRSymbol,
	#instVars : [
		'index',
		'offset'
	],
	#category : #'Tinyrossa-IL-Symbols'
}

{ #category : #'instance creation' }
TRRegisterMappedSymbol class >> name:name type:type index: index [ 
	^ self basicNew initializeWithName:name type:type index: index
]

{ #category : #conversion }
TRRegisterMappedSymbol >> asAcDSLOperand [
	^ AcDSLSymbol value: name
]

{ #category : #accessing }
TRRegisterMappedSymbol >> index [
	"Return (sequential) index of symbol.

	 First parameter has index 1, seconds has index 2 and so on.
	 Same for automatics (locals)."

	^ index
]

{ #category : #initialization }
TRRegisterMappedSymbol >> initializeWithName:nameArg type:typeArg index: indexArg [
	name := nameArg.
	type := typeArg.
	index := indexArg.
]

{ #category : #accessing }
TRRegisterMappedSymbol >> offset [
	"Returns offset from frame pointer in bytes"
	^ offset
]

{ #category : #initialization }
TRRegisterMappedSymbol >> setOffset: anInteger [
	self assume: anInteger is: Integer.
	self assume: offset is: nil.

	offset := anInteger
]
