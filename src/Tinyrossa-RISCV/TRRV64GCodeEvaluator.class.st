Class {
	#name : #TRRV64GCodeEvaluator,
	#superclass : #TRCodeEvaluator,
	#pools : [
		'TRDataTypes',
		'TRRV64GRegisters'
	],
	#category : #'Tinyrossa-RISCV-Codegen'
}

{ #category : #'evaluation-helpers' }
TRRV64GCodeEvaluator >> evaluate_Xcmpgt: node [
	"Handles Address, Int64 Int32, Int16 & Int8"  

	| src1Reg src2Reg trgReg |

	src1Reg := self evaluate: node child1.
	src2Reg := self evaluate: node child2.
	trgReg := codegen allocateRegister.
	generate 
		slt: trgReg, src2Reg, src1Reg.
	^ trgReg
]

{ #category : #'evaluation-helpers' }
TRRV64GCodeEvaluator >> evaluate_Xcmplt: node [
	"Handles Address, Int64 Int32, Int16 & Int8"  

	| src1Reg src2Reg trgReg |

	src1Reg := self evaluate: node child1.
	src2Reg := self evaluate: node child2.
	trgReg := codegen allocateRegister.
	generate 
		slt: trgReg, src1Reg, src2Reg.
	^ trgReg
]

{ #category : #'evaluation-helpers' }
TRRV64GCodeEvaluator >> evaluate_Xloadi: node [
	"Handles Address, Int64 Int32, Int16 & Int8"  

	| dstReg baseReg offset type |

	"FIXME: we can do better by checking for loads in form
	
	   Xloadi 
	     aXadd
	        ...
	        Xconst offset
	
	 and check if offset fits into displacement immediate and if
	 so, generate 
	
	   ld dstReg, offset ( ... )
	
	 But for now, this will do.
	"
	baseReg := self evaluate: node child1.
	offset := 0.
	
	
	dstReg := codegen allocateRegister.

	type := node type.
	(type == Address or:[type == Int64]) ifTrue:[
		generate
			ld: dstReg, (baseReg + offset).
	] ifFalse:[ type == Int32 ifTrue:[
		generate
			lw: dstReg, (baseReg + offset).		
	] ifFalse:[ type == Int16 ifTrue:[
		generate
			lh: dstReg, (baseReg + offset).		
	] ifFalse:[ type == Int8 ifTrue:[
		generate
			lb: dstReg, (baseReg + offset).		
	]]]].

	^dstReg.
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_acmpgt: node [
	^ self evaluate_Xcmpgt: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_acmplt: node [
	^ self evaluate_Xcmplt: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_aconst: node [
	^self evaluate_lconst: node

]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_aiadd: node [
	^ self evaluate_iadd: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_aladd: node [
	^ self evaluate_iadd: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_aload: node [
	^ self evaluate_lload: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_aloadi: node [
	^ self evaluate_Xloadi: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_astore: node [
	^ self evaluate_lstore: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_bconst: node [
	^ self evaluate_iconst: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_bloadi: node [
	^ self evaluate_Xloadi: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_goto: node [
	generate
		jal: zero, node symbol.
	^ nil
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_i2a: node [
	^ self evaluate: node child1
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_iadd: node [
	"Also handles ladd, aiadd and aladd"
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
	^ self evaluate_Xcmpgt: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_icmplt: node [
	^ self evaluate_Xcmplt: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_iconst: node [
	| dstReg |

	node constant == 0 ifTrue: [ ^ zero ].

	dstReg := self codegen allocateRegister.

	codegen loadConstant32: node constant into: dstReg.

	^ dstReg
]

{ #category : #'evaluation-helpers' }
TRRV64GCodeEvaluator >> evaluate_ifXcmpeq: node [
	"Handles Address, Int64 Int32, Int16 & Int8"  

	| src1Reg src2Reg |

	src1Reg := self evaluate: node child1.
	src2Reg := self evaluate: node child2.
	generate 
		beq: src1Reg, src2Reg, node symbol.
	^ nil
]

{ #category : #'evaluation-helpers' }
TRRV64GCodeEvaluator >> evaluate_ifXcmpge: node [
	"Handles Address, Int64 Int32, Int16 & Int8"  

	| src1Reg src2Reg |

	src1Reg := self evaluate: node child1.
	src2Reg := self evaluate: node child2.
	generate 
		bge: src1Reg, src2Reg, node symbol.
	^ nil
]

{ #category : #'evaluation-helpers' }
TRRV64GCodeEvaluator >> evaluate_ifXcmpgt: node [
	"Handles Address, Int64 Int32, Int16 & Int8"  

	| src1Reg src2Reg |

	src1Reg := self evaluate: node child1.
	src2Reg := self evaluate: node child2.
	generate 
		blt: src2Reg, src1Reg, node symbol.
	^ nil
]

{ #category : #'evaluation-helpers' }
TRRV64GCodeEvaluator >> evaluate_ifXcmple: node [
	"Handles Address, Int64 Int32, Int16 & Int8"  

	| src1Reg src2Reg |

	src1Reg := self evaluate: node child1.
	src2Reg := self evaluate: node child2.
	generate 
		bge: src2Reg, src1Reg, node symbol.
	^ nil
]

{ #category : #'evaluation-helpers' }
TRRV64GCodeEvaluator >> evaluate_ifXcmplt: node [
	"Handles Address, Int64 Int32, Int16 & Int8"  

	| src1Reg src2Reg |

	src1Reg := self evaluate: node child1.
	src2Reg := self evaluate: node child2.
	generate 
		blt: src1Reg, src2Reg, node symbol.
	^ nil
]

{ #category : #'evaluation-helpers' }
TRRV64GCodeEvaluator >> evaluate_ifXcmpne: node [
	"Handles Address, Int64 Int32, Int16 & Int8" 

	| src1Reg src2Reg |

	src1Reg := self evaluate: node child1.
	src2Reg := self evaluate: node child2.
	generate 
		bne: src1Reg, src2Reg, node symbol.
	^ nil
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_ifacmpeq: node [
	^ self evaluate_ifXcmpeq: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_ifacmpge: node [
	^ self evaluate_ifXcmpge: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_ifacmpgt: node [
	^ self evaluate_ifXcmpgt: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_ifacmple: node [
	^ self evaluate_ifXcmple: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_ifacmplt: node [
	^ self evaluate_ifXcmplt: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_ifacmpne: node [
	^ self evaluate_ifXcmpne: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_ificmpeq: node [
	^ self evaluate_ifXcmpeq: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_ificmpge: node [
	^ self evaluate_ifXcmpge: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_ificmpgt: node [
	^ self evaluate_ifXcmpgt: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_ificmple: node [
	^ self evaluate_ifXcmple: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_ificmplt: node [
	^ self evaluate_ifXcmplt: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_ificmpne: node [
	^ self evaluate_ifXcmpne: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_iflcmpeq: node [
	^ self evaluate_ifXcmpeq: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_iflcmpge: node [
	^ self evaluate_ifXcmpge: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_iflcmpgt: node [
	^ self evaluate_ifXcmpgt: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_iflcmple: node [
	^ self evaluate_ifXcmple: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_iflcmplt: node [
	^ self evaluate_ifXcmplt: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_iflcmpne: node [
	^ self evaluate_ifXcmpne: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_iload: node [
	| symbol dstReg |

	symbol := node symbol.
	dstReg := codegen allocateRegister.
	generate lw: dstReg, (sp + (AcDSLSymbol value: symbol name)).
	^ dstReg
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_iloadi: node [
	^ self evaluate_Xloadi: node
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
TRRV64GCodeEvaluator >> evaluate_l2a: node [
	^ self evaluate: node child1
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_ladd: node [
	^ self evaluate_iadd: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_lcmpgt: node [
	^ self evaluate_Xcmpgt: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_lcmplt: node [
	^ self evaluate_Xcmplt: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_lconst: node [
	| dstReg |

	node constant == 0 ifTrue: [ ^ zero ].

	dstReg := self codegen allocateRegister.

	codegen loadConstant64: node constant into: dstReg.

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
TRRV64GCodeEvaluator >> evaluate_lmul: node [
	^self emitMul: node.
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_lor: node [
	^self emitBin: node opcodeR: 'or' opcodeI: 'ori'
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_lshr: node [
	^self emitShr: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_lstore: node [
	| symbol srcReg |

	symbol := node symbol.
	srcReg := self evaluate: node child1.
	generate sd: srcReg, (sp + (AcDSLSymbol value: symbol name)).
	^ nil
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_lsub: node [
	^self emitBin: node opcodeR: 'sub' opcodeI: 'addi'
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_sconst: node [
	^ self evaluate_iconst: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_sloadi: node [
	^ self evaluate_Xloadi: node
]
