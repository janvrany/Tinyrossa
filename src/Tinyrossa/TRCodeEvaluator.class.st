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

	node block isExtension ifFalse: [ 
		| automatics parameters |

		automatics := codegen compilation symbolManager lookupSymbolsByType: TRAutomaticSymbol.
		automatics do: [:automatic | 
			automatic setRegister: nil.
		].

		parameters := codegen compilation symbolManager lookupSymbolsByType: TRParameterSymbol.
		parameters do: [:parameter | 
			parameter setRegister: nil.
		].            
	].

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
TRCodeEvaluator >> evaluate_dcall: node [
	^ self evaluate_call: node
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
TRCodeEvaluator >> evaluate_freturn: node [
	^ self evaluate_return: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_icall: node [
	^ self evaluate_call: node
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
TRCodeEvaluator >> evaluate_lreturn: node [
	^ self evaluate_return: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_return: node [
	| retReg |

	self assert: codegen compilation functionType == node child1 type.

	retReg := self evaluate: node child1.
	generate leave: retReg.
	^ retReg
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
