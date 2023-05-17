Class {
	#name : #TRILCommoner,
	#superclass : #TRILRewritingPass,
	#instVars : [
		'stores',
		'loads'
	],
	#pools : [
		'TRILOpcodes'
	],
	#category : #'Tinyrossa-Optimizer'
}

{ #category : #commoning }
TRILCommoner >> common: node [
	| op |

	op := node opcode.

	"Replace 'load x' following 'store v into x' by just 'v', elimitinating
	 the load (and hopefully the store too).

	 This does not handle indirect loads/stores nor read/write barriers.
	"
	op isIndirect ifFalse: [ 
		(op isStore and: [ op isWriteBarrierStore not]) ifTrue: [ 
			stores at: node symbol put: node.
			^ node.
		].
		(op isLoadVar and: [ op isReadBarrierLoad not]) ifTrue: [ 
			| store load |

			store := stores at: node symbol ifAbsent: [ nil ].
			store notNil ifTrue: [ 
				^ store child1
			].

			load := loads at: node symbol ifAbsent: [ nil ].
			load notNil ifTrue: [ 
				^ load.
			].
			loads at: node symbol put: node.            
		]                
	].
	^ node

	"
	TRILOpcodes all select:[:op | op isStore]
	TRILOpcodes all select:[:op | op isLoad]
	"
]

{ #category : #evaluation }
TRILCommoner >> evaluate: node [
	^ self common: (super evaluate: node)
]

{ #category : #evaluation }
TRILCommoner >> evaluate_bbstart: node [
	stores := Dictionary new.
	loads := Dictionary new.
	^ node
]
