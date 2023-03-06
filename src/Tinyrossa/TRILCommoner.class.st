Class {
	#name : #TRILCommoner,
	#superclass : #TRILRewritingPass,
	#instVars : [
		'stores'
	],
	#pools : [
		'TRILOpcodes'
	],
	#category : #'Tinyrossa-Optimizer'
}

{ #category : #evaluation }
TRILCommoner >> evaluate_bbstart: node [
	stores := Dictionary new.
	^ node
]

{ #category : #evaluation }
TRILCommoner >> evaluate_iload: node [    
	| store |

	store := stores at: node symbol ifAbsent: [ nil ].
	store notNil ifTrue: [ 
		^ store child1
	].
	^ node
]

{ #category : #evaluation }
TRILCommoner >> evaluate_istore: node [
	stores at: node symbol put: node.
	^ node
]
