Class {
	#name : #TRLabelSymbol,
	#superclass : #TRSymbol,
	#instVars : [
		'block'
	],
	#category : #'Tinyrossa-IL-Symbols'
}

{ #category : #'instance creation' }
TRLabelSymbol class >> block: aTRILBlock [
	^ self basicNew initializeWithBlock: aTRILBlock

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
TRLabelSymbol >> initializeWithBlock: aTRILBlock [
	self assert: aTRILBlock isTRILBlock.

	name := aTRILBlock name.
	type := TRDataType named: 'Void'.
	block := aTRILBlock.
]

{ #category : #testing }
TRLabelSymbol >> isTRLabelSymbol [
	^ true
]
