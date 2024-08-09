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
TRRV64GCodeEvaluator >> commonBin: node opcodeR: opR opcodeI: opI [
	"Common helper for binary operation using R-type instruction or I-type
	 instruction. The I-type instruction is used when second operand is a load
	 constant and constant value fits into I-type instruction immediate,
	 Otherwise, R-type instruction is used."
	
	| child1 child2 src1Reg src2Reg dstReg |
	
	child1 := node child1.
	child2 := node child2.
	
	src1Reg := self evaluate: child1.
	dstReg := self codegen allocateRegister.
	
	(child2 opcode isLoadConst and: [ opI notNil and:[ codegen fitsInItypeImm: child2 constant ]]) ifTrue:[
		| value |
		
		value := child2 constant.
		(opR = 'sub' or:[opR = 'subw']) ifTrue:[
			generate addi: dstReg , src1Reg , value negated.
		] ifFalse:[
			generate append: opI operands: dstReg , src1Reg , value
		].	
	] ifFalse: [ 
		src2Reg := self evaluate: child2.
		generate append: opR operands: dstReg , src1Reg , src2Reg
	].


	^ dstReg
]

{ #category : #'evaluation-helpers' }
TRRV64GCodeEvaluator >> commonDiv: node [
	"Handles imul and lmul"

	| child1 child2 src1Reg src2Reg dstReg |

	child1 := node child1.
	child2 := node child2.

	src1Reg := self evaluate: child1.

	(child2 opcode isLoadConst and: [child2 constant == 1]) ifTrue:[
		dstReg := src1Reg.
	] ifFalse:[
	(child2 opcode isLoadConst and: [child2 constant == -1]) ifTrue:[
			dstReg := self codegen allocateRegister.
			generate sub: dstReg, zero, src1Reg
	] ifFalse:[
		src2Reg := self evaluate: child2.
		dstReg := self codegen allocateRegister.

		node type == Int64 ifTrue:[
			generate div: dstReg, src1Reg , src2Reg
		] ifFalse:[
			generate divw: dstReg, src1Reg , src2Reg
		].
	]].

	^dstReg
]

{ #category : #'evaluation-helpers' }
TRRV64GCodeEvaluator >> commonLoad: node [
	"Handles aload, lload, iload, sload & bload"  

	| dstReg baseReg offset type |

	node symbol isTRStaticSymbol ifTrue: [
		| l0 |

		baseReg := codegen allocateRegister.
		l0 := codegen allocateLabel.

		generate label: l0.
		generate auipc: baseReg, (R_RISCV_GOT_HI20 % node symbol).
		generate ld:    baseReg, (baseReg + (R_RISCV_PCREL_LO12_I % l0)).
		offset := 0.
	] ifFalse: [
		baseReg := sp.
		offset := node symbol.
	].
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

{ #category : #'evaluation-helpers' }
TRRV64GCodeEvaluator >> commonMul: node [
	"Handles imul and lmul"
	
	| child1 child2 src1Reg src2Reg dstReg |
	
	child1 := node child1.
	child2 := node child2.
	
	src1Reg := self evaluate: child1.
		
	(child2 opcode isLoadConst and: [child2 constant between: -1 and: 1]) ifTrue:[
		child2 constant == 0 ifTrue:[
			dstReg := zero
		] ifFalse:[
		child2 constant == 1 ifTrue:[
			dstReg := src1Reg.
		] ifFalse:[
		child2 constant == -1 ifTrue:[
			dstReg := self codegen allocateRegister.
			generate sub: dstReg, zero, src1Reg
		]]].
	] ifFalse:[
		src2Reg := self evaluate: child2.
		dstReg := self codegen allocateRegister.

		codegen compilation config stressRA ifTrue: [
			"User requested to put more stress on RA (presumably for
			 RA debugging purposes).

			 So here we force argument and return value to be in
			 certain real register."

			| real insn deps |

			real := t0.
			deps := TRRegisterDependencies new.
			deps pre addDependency: src1Reg on: real.
			deps post addDependency: dstReg on: real.

			node type == Int64 ifTrue:[
				insn := generate mul: real, real , src2Reg
			] ifFalse:[
				insn := generate mulw: real, real , src2Reg
			].
			insn dependencies: deps.
		] ifFalse: [
			node type == Int64 ifTrue:[
				generate mul: dstReg, src1Reg , src2Reg
			] ifFalse:[
				generate mulw: dstReg, src1Reg , src2Reg
			].
		].



	].

	^dstReg
]

{ #category : #'evaluation-helpers' }
TRRV64GCodeEvaluator >> commonShl: node [
	"Handles ishl and lshl"
	
	| width child1 child2 src1Reg src2Reg dstReg |
	
	width := node type sizeInBytes * 8.
	
	child1 := node child1.
	child2 := node child2.
	
	src1Reg := self evaluate: child1.
		
	(child2 opcode isLoadConst) ifTrue:[
		| shamt |
		
		shamt := child2 constant bitAnd: width - 1.
		shamt == 0 ifTrue:[
			dstReg := src1Reg.	
		] ifFalse: [
			dstReg := self codegen allocateRegister.
			generate slli: dstReg, src1Reg, shamt.
		].
	] ifFalse:[	
		src2Reg := self evaluate: child2.		
		dstReg := self codegen allocateRegister.
		node type == Int64 ifTrue:[
			generate sll: dstReg, src1Reg , src2Reg 
		].
	].

	^dstReg

]

{ #category : #'evaluation-helpers' }
TRRV64GCodeEvaluator >> commonShr: node [
	"Handles ishr and lshr"
	
	| width child1 child2 src1Reg src2Reg dstReg |
	
	width := node type sizeInBytes * 8.
	
	child1 := node child1.
	child2 := node child2.
	
	src1Reg := self evaluate: child1.
		
	(child2 opcode isLoadConst) ifTrue:[
		| shamt |
		
		shamt := child2 constant bitAnd: width - 1.
		shamt == 0 ifTrue:[
			dstReg := src1Reg.	
		] ifFalse: [
			dstReg := self codegen allocateRegister.
			generate srai: dstReg, src1Reg, shamt.
		].
	] ifFalse:[	
		src2Reg := self evaluate: child2.		
		dstReg := self codegen allocateRegister.
		node type == Int64 ifTrue:[
			generate sra: dstReg, src1Reg , src2Reg 
		].
	].

	^dstReg

]

{ #category : #'evaluation-helpers' }
TRRV64GCodeEvaluator >> commonStore: node [
	"Handles astore, lstore, istore, sstore & bstore"  

	| srcReg baseReg offset type |

	srcReg := self evaluate: node child1.
	node symbol isTRStaticSymbol ifTrue: [
		| l0 |

		baseReg := codegen allocateRegister.
		l0 := codegen allocateLabel.

		generate label: l0.
		generate auipc: baseReg, (R_RISCV_GOT_HI20 % node symbol).
		generate ld:    baseReg, (baseReg + (R_RISCV_PCREL_LO12_I % l0)).
		offset := 0.
	] ifFalse: [
		baseReg := sp.
		offset := node symbol name.
	].

	type := node type.
	(type == Address or:[type == Int64]) ifTrue:[
		generate
			sd: srcReg, (baseReg + offset).
	] ifFalse:[ type == Int32 ifTrue:[
		generate
			sw: srcReg, (baseReg + offset).
	] ifFalse:[ type == Int16 ifTrue:[
		generate
			sh: srcReg, (baseReg + offset).
	] ifFalse:[ type == Int8 ifTrue:[
		generate
			sb: srcReg, (baseReg + offset).
	]]]].

	^nil.
]

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
TRRV64GCodeEvaluator >> evaluate_a2b: node [
	^ self evaluate: node child1
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_a2i: node [
	^ self evaluate: node child1
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_a2l: node [
	^ self evaluate: node child1
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_a2s: node [
	^ self evaluate: node child1
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
	^ self commonBin: node opcodeR: 'add' opcodeI: 'addi'
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_aladd: node [
	^ self commonBin: node opcodeR: 'add' opcodeI: 'addi'
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_aload: node [
	^ self commonLoad: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_aloadi: node [
	^ self evaluate_Xloadi: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_astore: node [
	^ self commonStore: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_bconst: node [
	^ self evaluate_iconst: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_bload: node [
	^ self commonLoad: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_bloadi: node [
	^ self evaluate_Xloadi: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_bstore: node [
	^ self commonStore: node
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
TRRV64GCodeEvaluator >> evaluate_i2l: node [
	^ self evaluate: node child1
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_iadd: node [
	^self commonBin: node opcodeR: 'addw' opcodeI: 'addiw'
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_iand: node [
	^self commonBin: node opcodeR: 'andw' opcodeI: 'andiw'
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

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_idiv: node [
	^self commonDiv: node.
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
	^ self commonLoad: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_iloadi: node [
	^ self evaluate_Xloadi: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_imul: node [
	^self commonMul: node.
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_ior: node [
	^self commonBin: node opcodeR: 'orw' opcodeI: 'oriw'
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_ishl: node [
	^self commonShl: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_ishr: node [
	^self commonShr: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_istore: node [
	^ self commonStore: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_isub: node [
	^self commonBin: node opcodeR: 'subw' opcodeI: 'addiw'
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_l2a: node [
	^ self evaluate: node child1
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_ladd: node [
	^self commonBin: node opcodeR: 'add' opcodeI: 'addi'
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_land: node [
	^self commonBin: node opcodeR: 'and' opcodeI: 'andi'
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
TRRV64GCodeEvaluator >> evaluate_ldiv: node [
	^self commonDiv: node.
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_lload: node [
	^ self commonLoad: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_lmul: node [
	^self commonMul: node.
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_loadaddr: node [
	| dstReg |

	dstReg := codegen allocateRegister.

	node symbol isTRStaticSymbol ifTrue: [
		| l0 |

		l0 := codegen allocateLabel.

		generate label: l0.
		generate auipc: dstReg, (R_RISCV_GOT_HI20 % node symbol).
		generate ld:    dstReg, (dstReg + (R_RISCV_PCREL_LO12_I % l0)).
	] ifFalse: [
		generate addi:  dstReg, sp, node symbol.
	].

	^ dstReg
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_lor: node [
	^self commonBin: node opcodeR: 'or' opcodeI: 'ori'
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_lshl: node [
	^self commonShl: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_lshr: node [
	^self commonShr: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_lstore: node [
	^ self commonStore: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_lsub: node [
	^self commonBin: node opcodeR: 'sub' opcodeI: 'addi'
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_overflowchk: node [
	| operationNode src1Reg src2Reg |

	self assert: node child1 opcode mayOverflow.  
	self assert: node child1 child1 == node child2.
	self assert: node child1 child2 == node child3.

	operationNode := node child1.
	src1Reg := self evaluate: operationNode child1.
	src2Reg := self evaluate: operationNode child2.      

	operationNode opcode isAdd ifTrue: [ 
		operationNode type == Int32 ifTrue: [ 
			| dstReg tmpReg |

			dstReg := self evaluate: operationNode.
			tmpReg := self codegen allocateRegister.

			generate
				add: tmpReg, src1Reg, src2Reg;
				bne: dstReg, tmpReg, node symbol.

			^ nil.            
		].
	].
	operationNode opcode isMul ifTrue: [ 
		operationNode type == Int32 ifTrue: [ 
			| dstReg tmpReg |

			dstReg := self evaluate: operationNode.
			tmpReg := self codegen allocateRegister.

			generate
				mul: tmpReg, src1Reg, src2Reg;
				bne: dstReg, tmpReg, node symbol.

			^ nil.            
		].
		operationNode type == Int64 ifTrue: [
			| dstReg tmp1Reg tmp2Reg |

			dstReg := self evaluate: operationNode.
			tmp1Reg := self codegen allocateRegister.      
			tmp2Reg := self codegen allocateRegister.      

			generate
				mulh: tmp1Reg, src1Reg, src2Reg;
				srai: tmp2Reg, dstReg, 63;
				bne: tmp1Reg, tmp2Reg, node symbol.

			^ nil
		]

	].
	self error: 'Operation or type not yet supported'
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_sconst: node [
	^ self evaluate_iconst: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_sload: node [
	^ self commonLoad: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_sloadi: node [
	^ self evaluate_Xloadi: node
]

{ #category : #evaluation }
TRRV64GCodeEvaluator >> evaluate_sstore: node [
	^ self commonStore: node
]
