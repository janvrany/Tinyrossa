Class {
	#name : #TRRV64GCodeGenerator,
	#superclass : #TRCodeGenerator,
	#instVars : [
		'generate',
		'currentNode'
	],
	#pools : [
		'TRRV64GRegisters'
	],
	#category : #'Tinyrossa-RISCV-Codegen'
}

{ #category : #registers }
TRRV64GCodeGenerator >> allocatableRegisters [
	"Return a collection of machine registers that can be
	 allocated"

	"FIXME: bogus!"
	^ { t0 . t1 . t2 . t3 . t4 . t5 . t6 . a0 . a1 . a2 }
]

{ #category : #accessing }
TRRV64GCodeGenerator >> codeBuffer [
	^ generate memory
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate: node [
	| savedNode |

	savedNode := currentNode.
	currentNode := node.
	^ [ super evaluate: node ] 
		ensure: [ currentNode := savedNode.].
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bbstart: node [
	| label |

	label := compilation symbolManager lookupLabelByBlock: node block.
	label notNil ifTrue: [ 
		generate label: label name.
	].
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iadd: node [
	| src1Reg src2Reg dstReg |

	src1Reg := self evaluate: node child1.
	src2Reg := self evaluate: node child2.
	dstReg := self allocateRegister.
	generate
		add: dstReg, src1Reg, src2Reg.

	^ dstReg
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iconst: node [
	| dstReg |

	node constant == 0 ifTrue: [ ^ zero ].

	dstReg := self allocateRegister.

	generate 
		addi: dstReg, zero, node constant.

	^ dstReg
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ificmpge: node [
	| src1Reg src2Reg |

	src1Reg := self evaluate: node child1.
	src2Reg := self evaluate: node child2.
	^ generate 
		bge: src1Reg, src2Reg, node symbol
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ificmple: node [
	| src1Reg src2Reg |

	src1Reg := self evaluate: node child1.
	src2Reg := self evaluate: node child2.
	^ generate 
		bge: src2Reg, src1Reg, node symbol
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iload: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	| location |

	location := node symbol location.
	self assert: location notNil.

	location isTRVirtualRegister ifTrue: [ 
		^ location
	] ifFalse: [ 
		self notYetImplemented
	].
]

{ #category : #relocation }
TRRV64GCodeGenerator >> fixupBranchTargets [    
	self codeBuffer fixupBranchTargets
]

{ #category : #'code generation' }
TRRV64GCodeGenerator >> generateEpilogue: valReg [
	| retReg retInsn |

	retReg := self allocateRegister.

	retInsn := generate
		addi: retReg, valReg, 0; "Move value to ABI return register"
		jalr: zero, ra, 0.       "Return"

	retReg constrainTo: a0 atInstruction: retInsn.
]

{ #category : #'code generation' }
TRRV64GCodeGenerator >> generatePrologue [
	| parameters parameterRegs |

	parameters := compilation symbolManager lookupSymbolsByType: TRParameterSymbol.

	"FIXME: following is bogus, does not follow RISC-V ABI,
	 does not handle floating point, does not handle stack-passed
	 parameters. Bogus!"

	parameterRegs := { a0 . a1 . a2 . a3 . a4 . a5 . a6 . a7 }.
	parameters do: [:parameter | 
		| rReg vReg |

		rReg := parameterRegs at: parameter index.

		vReg := self allocateRegister.
		vReg constrainTo: rReg.

		parameter setLocation: vReg.
	].
]

{ #category : #private }
TRRV64GCodeGenerator >> ground: instruction using: encoding [
	| insn |

	insn := instruction as: TRRV64GInstruction.
	insn setBinaryEncoding: encoding
	   "Set the TRIL node that caused this instruction to be generated - if not
	   already set (which happens when you ground a partially grounded
	   instruction).
	   It's bit tricky, but this is the API that ArchC provides at the moment.
	  ".
	"Set the TRIL node that caused this instruction to be generated - if not
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
TRRV64GCodeGenerator >> initializeWithCompilation: aTRCompilation [
	super initializeWithCompilation: aTRCompilation.
	generate := AcDSLRV64GAssembler new.
	generate grounder: self
]

{ #category : #accessing }
TRRV64GCodeGenerator >> instructions [
	^ generate memory instructions.
]
