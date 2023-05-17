Class {
	#name : #TRRV64GCodeEvaluator,
	#superclass : #TRCodeEvaluator,
	#pools : [
		'TRRV64GRegisters'
	],
	#category : #'Tinyrossa-RISCV-Codegen'
}

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_aload: node [
	^ self evaluate_lload: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_astore: node [
	^ self evaluate_lstore: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_goto: node [
	generate
		jal: zero, node symbol.
	^ nil
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_iadd: node [
	| src1Reg src2Reg dstReg |

	dstReg := self codegen allocateRegister.
	src1Reg := self evaluate: node child1.

	(node child2 opcode isLoadConst and: [ codegen fitsInItypeImm: node child2 constant ]) ifTrue: [ 
		generate
			addi: dstReg, src1Reg, node child2 constant
	] ifFalse: [
		src2Reg := self evaluate: node child2.
		generate
			addw: dstReg, src1Reg, src2Reg.
	].

	^ dstReg
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_icmpgt: node [
	| src1Reg src2Reg trgReg |

	src1Reg := self evaluate: node child1.
	src2Reg := self evaluate: node child2.
	trgReg := codegen allocateRegister.
	generate 
		slt: trgReg, src2Reg, src1Reg.
	^ trgReg
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_icmplt: node [
	| src1Reg src2Reg trgReg |

	src1Reg := self evaluate: node child1.
	src2Reg := self evaluate: node child2.
	trgReg := codegen allocateRegister.
	generate 
		slt: trgReg, src1Reg, src2Reg.
	^ trgReg
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_iconst: node [
	| dstReg |

	node constant == 0 ifTrue: [ ^ zero ].

	dstReg := self codegen allocateRegister.

	generate 
		addi: dstReg, zero, node constant.

	^ dstReg
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_ificmpeq: node [
	| src1Reg src2Reg |

	src1Reg := self evaluate: node child1.
	src2Reg := self evaluate: node child2.
	generate 
		beq: src1Reg, src2Reg, node symbol.
	^ nil
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_ificmpge: node [
	| src1Reg src2Reg |

	src1Reg := self evaluate: node child1.
	src2Reg := self evaluate: node child2.
	generate 
		bge: src1Reg, src2Reg, node symbol.
	^ nil
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_ificmpgt: node [
	| src1Reg src2Reg |

	src1Reg := self evaluate: node child1.
	src2Reg := self evaluate: node child2.
	generate 
		blt: src2Reg, src1Reg, node symbol.
	^ nil
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_ificmple: node [
	| src1Reg src2Reg |

	src1Reg := self evaluate: node child1.
	src2Reg := self evaluate: node child2.
	generate 
		bge: src2Reg, src1Reg, node symbol.
	^ nil
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_ificmplt: node [
	| src1Reg src2Reg |

	src1Reg := self evaluate: node child1.
	src2Reg := self evaluate: node child2.
	generate 
		blt: src1Reg, src2Reg, node symbol.
	^ nil
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_ificmpne: node [
	| src1Reg src2Reg |

	src1Reg := self evaluate: node child1.
	src2Reg := self evaluate: node child2.
	generate 
		bne: src1Reg, src2Reg, node symbol.
	^ nil
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_iload: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	| symbol dstReg |

	symbol := node symbol.
	dstReg := codegen allocateRegister.
	generate lw: dstReg, (sp + (AcDSLSymbol value: symbol name)).
	^ dstReg
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_imul: node [
	| src1Reg src2Reg dstReg |

	src1Reg := self evaluate: node child1.
	src2Reg := self evaluate: node child2.
	dstReg := self codegen allocateRegister.
	generate
		mulw: dstReg, src1Reg, src2Reg.

	^ dstReg
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_istore: node [
	| symbol srcReg |

	symbol := node symbol.
	srcReg := self evaluate: node child1.
	generate sw: srcReg, (sp + (AcDSLSymbol value: symbol name)).
	^ nil
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_isub: node [
	| src1Reg src2Reg dstReg |

	dstReg := self codegen allocateRegister.
	src1Reg := self evaluate: node child1.

	(node child2 opcode isLoadConst and: [ codegen fitsInItypeImm: node child2 constant negated ]) ifTrue: [ 
		generate
			addi: dstReg, src1Reg, node child2 constant negated
	] ifFalse: [
		src2Reg := self evaluate: node child2.
		generate
			subw: dstReg, src1Reg, src2Reg.
	].

	^ dstReg
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_lload: node [
	| symbol dstReg |

	symbol := node symbol.
	dstReg := codegen allocateRegister.
	generate ld: dstReg, (sp + (AcDSLSymbol value: symbol name)).
	^ dstReg
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_lstore: node [
	| symbol srcReg |

	symbol := node symbol.
	srcReg := self evaluate: node child1.
	generate sd: srcReg, (sp + (AcDSLSymbol value: symbol name)).
	^ nil
]