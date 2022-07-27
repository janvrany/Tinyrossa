Class {
	#name : #TRLabelSymbol,
	#superclass : #TRSymbol,
	#instVars : [
		'block'
	],
	#category : #'Tinyrossa-IL'
}

{ #category : #'instance creation' }
TRLabelSymbol class >> block: aTRILBlock [
	^ self basicNew initializeWithBlock: aTRILBlock

]

{ #category : #converting }
TRLabelSymbol >> asAcDSLOperand [
	^ AcDSLSymbol value: name
]

{ #category : #accessing }
TRLabelSymbol >> block [
	^ block
]

{ #category : #initialization }
TRLabelSymbol >> initializeWithBlock: aTRILBlock [
	name := aTRILBlock name.
	type := TRDataType named: 'Void'.
	block := aTRILBlock.

]

{ #category : #testing }
TRLabelSymbol >> isTRLabelSymbol [
	^ true
]
