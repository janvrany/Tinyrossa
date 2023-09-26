Class {
	#name : #TRILVerifier,
	#superclass : #TRILWalker,
	#instVars : [
		'compilation',
		'blocks',
		'allInCurrentBlock',
		'parents',
		'allInProcessedBlocks'
	],
	#category : #'Tinyrossa-IL-Utils'
}

{ #category : #'instance creation' }
TRILVerifier class >> forCompilation: aTRCompilation [
	^ self basicNew initializeWithCompilation: aTRCompilation
]

{ #category : #'instance creation' }
TRILVerifier class >> new [
	self shouldNotImplement. "Use #forCompilation:"
]

{ #category : #evaluation }
TRILVerifier >> evaluate: node [
	self verifyNode: node.
	super evaluate: node.
	allInCurrentBlock add: node.
]

{ #category : #evaluation }
TRILVerifier >> evaluateChildren: node [
	parents push: node.
	super evaluateChildren: node.
	parents pop.
	
]

{ #category : #initialization }
TRILVerifier >> initializeWithCompilation: aTRCompilation [
	compilation := aTRCompilation.
	
]

{ #category : #verification }
TRILVerifier >> verify [
	allInProcessedBlocks := Set new.
	blocks := compilation cfg blocks.
	compilation cfg preorderDo: [ :block | self verifyBlock: block ].
]

{ #category : #verification }
TRILVerifier >> verifyBlock: aTRILBlock [
	aTRILBlock precedessorsDo: [ :prec|
		self assert: (blocks includes: prec).
	].
	aTRILBlock successorsDo: [ :succ|
		self assert: (blocks includes: succ).
	].

	allInCurrentBlock := Set new.
	
	aTRILBlock treetops do:[:node| 
		parents := Stack new.
		self evaluate: node.
	].
	
	allInProcessedBlocks addAll: allInCurrentBlock.
]

{ #category : #verification }
TRILVerifier >> verifyNode: aTRILNode [
	self assert: (parents includes: aTRILNode) not 
	description: 'Cycle in TRIL!'.
	
	self assert: (allInProcessedBlocks includes: aTRILNode) not
	description: 'Nodes shared across basic blocks'.
		
	aTRILNode opcode isBranching ifTrue:[
		self assert: (allInCurrentBlock contains:[:node | node opcode isBranching]) not
		description: 'Two branching nodes in single block'
	].
]
