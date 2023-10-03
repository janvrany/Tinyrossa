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
		
	aTRILBlock compilation isAOT ifTrue:[	
		"In AOT mode to generate and object file we use external 
	 	 assembler (just like GCC) which treats labels prefixed with
	   '.L' as local (intra-procedural) labels and does not put them
	   into symbol table. We do the same here:"	
		name := '.L_' , aTRILBlock name.	
	] ifFalse: [
		name := aTRILBlock name.	
	].
		
	type := TRDataType named: 'Void'.
	block := aTRILBlock.
]

{ #category : #testing }
TRLabelSymbol >> isTRLabelSymbol [
	^ true
]
