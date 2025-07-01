Class {
	#name : #TRCodeEvaluator,
	#superclass : #TRILEvaluator,
	#instVars : [
		'codegen',
		'generate'
	],
	#category : #'Tinyrossa-Codegen'
}

{ #category : #'instance creation' }
TRCodeEvaluator class >> forCodeGenerator: aTRCodeGenerator [
	^ self basicNew initializeWithCodeGenerator: aTRCodeGenerator
]

{ #category : #'instance creation' }
TRCodeEvaluator class >> new [
	self shouldNotImplement. "Use #forCodeGenerator:"
]

{ #category : #accessing }
TRCodeEvaluator >> codegen [
	^ codegen
]

{ #category : #'evaluation-helpers' }
TRCodeEvaluator >> commonCall: node [
	| linkage |

	linkage := codegen createLinkage: node symbol linkageClass.
	^ linkage generateCall: node
]

{ #category : #'evaluation-helpers' }
TRCodeEvaluator >> commonCallIndirect: node [
	| linkage |

	linkage := codegen createLinkage: node symbol linkageClass.
	^ linkage generateCallIndirect: node
]

{ #category : #'evaluation-helpers' }
TRCodeEvaluator >> commonReturn: node [
	^ codegen linkage generateReturn: node.
]

{ #category : #accessing }
TRCodeEvaluator >> compilation [
	^ self codegen compilation
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate: node [
	| result |

	self assume: node is: TRILNode | [ :v | v isUsed ].
	self assume: (node result isNil or: [ node useCount > 1 ]).

	result := node result.
	result isNil ifTrue: [ 
		| saved |

		saved := generate annotations.
		generate annotations: (Set with: node).
		result := [ super evaluate: node ] ensure: [ generate annotations: saved ].
		node setResult: result.
	].
	^ result.
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_acall: node [
	^ self commonCall: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_acalli: node [
	^ self commonCallIndirect: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_areturn: node [
	^ self commonReturn: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_bbend: node [
	^ nil
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_bbstart: node [
	| label |

	label := self compilation symbolManager lookupLabelByBlock: node block.
	(label notNil and: [label isUsed]) ifTrue: [
		generate label: label.
	].
	^ nil
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_call: node [
	^ self commonCall: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_calli: node [
	^ self commonCallIndirect: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_dcall: node [
	^ self commonCall: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_dcalli: node [
	^ self commonCallIndirect: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_dreturn: node [
	^ self commonReturn: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_fcall: node [
	^ self commonCall: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_fcalli: node [
	^ self commonCallIndirect: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_freturn: node [
	^ self commonReturn: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_icall: node [
	^ self commonCall: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_icalli: node [
	^ self commonCallIndirect: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_ireturn: node [
	^ self commonReturn: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_lcall: node [
	^ self commonCall: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_lcalli: node [
	^ self commonCallIndirect: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_lreturn: node [
	^ self commonReturn: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_return: node [
	^ self commonReturn: node.
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_treetop: node [
	self evaluate: node child1.
	^ nil
]

{ #category : #initialization }
TRCodeEvaluator >> initializeWithCodeGenerator: aTRCodeGenerator [
	codegen := aTRCodeGenerator.
	generate := codegen assembler.
]

{ #category : #accessing }
TRCodeEvaluator >> target [
	^ self codegen target
]
