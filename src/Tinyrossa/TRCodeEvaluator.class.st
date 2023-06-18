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

{ #category : #accessing }
TRCodeEvaluator >> compilation [
	^ self codegen compilation
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate: node [
	| result |

	self assert: node isUsed.
	self assert: (node result isNil or: [ node useCount > 1 ]).

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
	^ self evaluate_call: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_acalli: node [
	^ self evaluate_calli: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_areturn: node [
	^ self evaluate_return: node
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
		generate label: label name.
	].
	^ nil
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_call: node [
	| linkage |

	linkage := codegen createLinkage: node symbol linkageClass.
	^ linkage generateCall: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_calli: node [
	| linkage |

	linkage := codegen createLinkage: node symbol linkageClass.
	^ linkage generateCallIndirect: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_dcall: node [
	^ self evaluate_call: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_dcalli: node [
	^ self evaluate_calli: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_dreturn: node [
	^ self evaluate_return: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_fcall: node [
	^ self evaluate_call: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_fcalli: node [
	^ self evaluate_calli: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_freturn: node [
	^ self evaluate_return: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_icall: node [
	^ self evaluate_call: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_icalli: node [
	^ self evaluate_calli: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_ireturn: node [
	^ self evaluate_return: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_lcall: node [
	^ self evaluate_call: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_lcalli: node [
	^ self evaluate_calli: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_lreturn: node [
	^ self evaluate_return: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_return: node [
	| retReg |

	self assert: codegen compilation functionType == node child1 type.

	retReg := self evaluate: node child1.
	generate leave: retReg.
	^ nil
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
