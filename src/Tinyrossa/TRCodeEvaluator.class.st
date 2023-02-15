Class {
	#name : #TRCodeEvaluator,
	#superclass : #TRILEvaluator,
	#instVars : [
		'codegen',
		'currentNode',
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
	| savedNode |

	self assert: node isUsed.

	savedNode := currentNode.
	currentNode := node.
	^ [ super evaluate: node ] 
		ensure: [ currentNode := savedNode.].
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_acall: node [
	^ self evaluate_call: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_areturn: node [
	self evaluate_return: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_bbend: node [
	"Nothing to do"
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
	self evaluate_return: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_fcall: node [
	^ self evaluate_call: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_freturn: node [
	self evaluate_return: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_icall: node [
	^ self evaluate_call: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_ireturn: node [
	self evaluate_return: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_lcall: node [
	^ self evaluate_call: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_lreturn: node [
	self evaluate_return: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_return: node [
	| retReg |

	self assert: codegen compilation functionType == node child1 type.

	retReg := self evaluate: node child1.
	generate leave: retReg
]

{ #category : #private }
TRCodeEvaluator >> ground: instruction using: encoding [ 
	| insn |

	insn := instruction as: codegen instructionClass.
	insn setBinaryEncoding: encoding.
	 "Set the TRIL node that caused this instruction to be generated - if not
	 already set (which happens when you ground a partially grounded
	 instruction).
	 It's bit tricky, but this is the API that ArchC provides at the moment.
	""Set the TRIL node that caused this instruction to be generated - if not
	 already set (which happens when you ground a partially grounded
	 instruction).
	 It's bit tricky, but this is the API that ArchC provides at the moment.
	"
	insn node isNil ifTrue: [
		insn node: currentNode.
	].
	^ insn
]

{ #category : #initialization }
TRCodeEvaluator >> initializeWithCodeGenerator: aTRCodeGenerator [
	codegen := aTRCodeGenerator.
	generate := codegen assembler.
	generate grounder: self.
]
