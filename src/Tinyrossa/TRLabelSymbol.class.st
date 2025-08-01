Class {
	#name : #TRLabelSymbol,
	#superclass : #TRStaticSymbol,
	#instVars : [
		'block'
	],
	#pools : [
		'TRDataTypes'
	],
	#category : #'Tinyrossa-IL-Symbols'
}

{ #category : #'instance creation' }
TRLabelSymbol class >> name: aString [
	^ self name: aString type: Void
]

{ #category : #accessing }
TRLabelSymbol >> block [
	^ block
]

{ #category : #conversion }
TRLabelSymbol >> got [
	^ self shouldNotImplement
]

{ #category : #initialization }
TRLabelSymbol >> initializeWithName:nameArg type:typeArg [
	self assert: typeArg == Void description: 'Type of a label must be void'.

	super initializeWithName:nameArg type:typeArg
]

{ #category : #testing }
TRLabelSymbol >> isTRLabelSymbol [
	^ true
]

{ #category : #initialization }
TRLabelSymbol >> setBlock: aTRILBlock [
	self assume: aTRILBlock isTRILBlock.

	block := aTRILBlock
]
