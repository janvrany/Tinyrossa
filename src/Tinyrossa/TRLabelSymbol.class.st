Class {
	#name : #TRLabelSymbol,
	#superclass : #TRSymbol,
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
	^ self basicNew initializeWithName: aString
]

{ #category : #converting }
TRLabelSymbol >> asAcDSLOperand [
	^ AcDSLSymbol value: name
]

{ #category : #converting }
TRLabelSymbol >> asAcDSLOperandList [
	^ self asAcDSLOperand asAcDSLOperandList
]

{ #category : #accessing }
TRLabelSymbol >> block [
	^ block
]

{ #category : #initialization }
TRLabelSymbol >> initializeWithName: aString [
	self assert: aString isString.
		
	name := aString.
	type := Void.
]

{ #category : #testing }
TRLabelSymbol >> isTRLabelSymbol [
	^ true
]

{ #category : #initialization }
TRLabelSymbol >> setBlock: aTRILBlock [
	self assert: aTRILBlock isTRILBlock.

	block := aTRILBlock
]
