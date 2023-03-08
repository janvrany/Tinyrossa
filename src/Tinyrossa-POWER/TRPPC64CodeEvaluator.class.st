Class {
	#name : #TRPPC64CodeEvaluator,
	#superclass : #TRCodeEvaluator,
	#pools : [
		'TRPPC64Registers',
		'TRPPC64RegisterKinds'
	],
	#category : #'Tinyrossa-POWER-Codegen'
}

{ #category : #evaluation }
TRPPC64CodeEvaluator >> evaluate_goto: node [
	generate b: node symbol.
	^ nil
]

{ #category : #evaluation }
TRPPC64CodeEvaluator >> evaluate_iadd: node [
	| src1Reg src2Reg dstReg |

	dstReg := self codegen allocateRegister.
	src1Reg := self evaluate: node child1.

	(node child2 opcode isLoadConst and: [ codegen fitsInDFormImm: node child2 constant ]) ifTrue: [ 
		generate
			addi: dstReg, src1Reg, node child2 constant
	] ifFalse: [
		src2Reg := self evaluate: node child2.
		generate
			add: dstReg, src1Reg, src2Reg.
	].
	generate extsw: dstReg, dstReg.

	^ dstReg
]

{ #category : #evaluation }
TRPPC64CodeEvaluator >> evaluate_iconst: node [
	| dstReg |

	dstReg := self codegen allocateRegister.

	generate 
		li: dstReg, node constant.

	^ dstReg
]

{ #category : #evaluation }
TRPPC64CodeEvaluator >> evaluate_ificmpge: node [
	| src1Reg src2Reg condReg |

	src1Reg := self evaluate: node child1.
	src2Reg := self evaluate: node child2.
	condReg := cr0. 

	generate 
		cmpw: condReg, src1Reg, src2Reg;
		bge: cr0, node symbol.

	^ nil
]

{ #category : #evaluation }
TRPPC64CodeEvaluator >> evaluate_ificmpgt: node [
	| src1Reg src2Reg condReg |

	src1Reg := self evaluate: node child1.
	src2Reg := self evaluate: node child2.
	condReg := cr0. 

	generate 
		cmpw: condReg, src1Reg, src2Reg;
		bgt: cr0, node symbol.

	^ nil
]

{ #category : #evaluation }
TRPPC64CodeEvaluator >> evaluate_ificmple: node [
	| src1Reg src2Reg condReg |

	src1Reg := self evaluate: node child1.
	src2Reg := self evaluate: node child2.
	condReg := cr0. 

	generate 
		cmpw: condReg, src1Reg, src2Reg;
		ble: cr0, node symbol.

	^ nil
]

{ #category : #evaluation }
TRPPC64CodeEvaluator >> evaluate_ificmplt: node [
	| src1Reg src2Reg condReg |

	src1Reg := self evaluate: node child1.
	src2Reg := self evaluate: node child2.
	condReg := cr0. 

	generate 
		cmpw: condReg, src1Reg, src2Reg;
		blt: cr0, node symbol.

	^ nil
]

{ #category : #evaluation }
TRPPC64CodeEvaluator >> evaluate_ificmpne: node [
	| src1Reg src2Reg condReg |

	src1Reg := self evaluate: node child1.
	src2Reg := self evaluate: node child2.
	condReg := cr0. 

	generate 
		cmpw: condReg, src1Reg, src2Reg;
		bne: cr0, node symbol.

	^ nil
]

{ #category : #evaluation }
TRPPC64CodeEvaluator >> evaluate_iload: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	| symbol dstReg |

	symbol := node symbol.
	dstReg := symbol register.
	dstReg isNil ifTrue: [ 
		dstReg := codegen allocateRegister.
		symbol setRegister: dstReg.
		generate lwz: dstReg, (gr1 + (AcDSLSymbol value: symbol name)).
	].
	^ dstReg
]

{ #category : #evaluation }
TRPPC64CodeEvaluator >> evaluate_imul: node [
	| src1Reg src2Reg dstReg |

	src1Reg := self evaluate: node child1.
	src2Reg := self evaluate: node child2.
	dstReg := self codegen allocateRegister.
	generate
		mullw: dstReg, src1Reg, src2Reg.

	^ dstReg
]

{ #category : #evaluation }
TRPPC64CodeEvaluator >> evaluate_istore: node [
	| symbol srcReg dstReg |

	symbol := node symbol.
	srcReg := self evaluate: node child1.
	dstReg := symbol register.
	dstReg isNil ifTrue: [
		dstReg := srcReg.
		symbol setRegister: dstReg.
	].
	srcReg ~~ dstReg ifTrue: [ 
		generate addi: dstReg, srcReg, 0.
	].
	generate stw: srcReg, (gr1 + (AcDSLSymbol value: symbol name)).

	^ nil
]

{ #category : #evaluation }
TRPPC64CodeEvaluator >> evaluate_isub: node [
	| src1Reg src2Reg dstReg |

	dstReg := self codegen allocateRegister.
	src1Reg := self evaluate: node child1.

	(node child2 opcode isLoadConst and: [ codegen fitsInDFormImm: node child2 constant negated ]) ifTrue: [ 
		generate
			addi: dstReg, src1Reg, node child2 constant negated
	] ifFalse: [
		src2Reg := self evaluate: node child2.
		generate
			subf: dstReg, src1Reg, src2Reg.
	].
	generate extsw: dstReg, dstReg.

	^ dstReg
]
