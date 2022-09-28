Class {
	#name : #TRRV64GCodeGenerator,
	#superclass : #TRCodeGenerator,
	#instVars : [
		'generate'
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

{ #category : #private }
TRRV64GCodeGenerator >> assembler [
	 ^ generate
]

{ #category : #'accessing-config' }
TRRV64GCodeGenerator >> assemblerClass [
	^ AcDSLRV64GAssembler
]

{ #category : #accessing }
TRRV64GCodeGenerator >> codeBuffer [
	^ generate memory
]

{ #category : #accessing }
TRRV64GCodeGenerator >> compilation [
	^ compilation
]

{ #category : #'accessing-config' }
TRRV64GCodeGenerator >> evaluatorClass [
	^ TRRV64GCodeEvaluator
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

		parameter setRegister: vReg.
	].
]

{ #category : #initialization }
TRRV64GCodeGenerator >> initializeWithCompilation: aTRCompilation [
	super initializeWithCompilation: aTRCompilation.
	generate := self assemblerClass new.
]

{ #category : #'accessing-config' }
TRRV64GCodeGenerator >> instructionClass [
	^ TRRV64GInstruction
]

{ #category : #accessing }
TRRV64GCodeGenerator >> instructions [
	^ generate memory instructions.
]
