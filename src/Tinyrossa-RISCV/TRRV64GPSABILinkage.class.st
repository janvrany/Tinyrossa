"
Implements RISC-V standard ps ABI [1]

[1]: https://github.com/riscv-non-isa/riscv-elf-psabi-doc

"
Class {
	#name : #TRRV64GPSABILinkage,
	#superclass : #TRLinkage,
	#instVars : [
		'generate'
	],
	#pools : [
		'TRRV64GRegisters'
	],
	#category : #'Tinyrossa-RISCV-Codegen'
}

{ #category : #accessing }
TRRV64GPSABILinkage >> allocatableRegisters [

	"FIXME: bogus!"
	^ { t0 . t1 . t2 . t3 . t4 . t5 . t6  . a0  }
]

{ #category : #'code generation' }
TRRV64GPSABILinkage >> generateEpilogue: valReg [
	codegen generate
		addi: a0, valReg, 0; "Move value to ABI return register"
		jalr: zero, ra, 0.       "Return"
]

{ #category : #'code generation' }
TRRV64GPSABILinkage >> generatePrologue [
	| parameters parameterRegs automatics |

	parameters := codegen compilation symbolManager lookupSymbolsByType: TRParameterSymbol.

	"FIXME: following is bogus, does not follow RISC-V ABI,
	 does not handle floating point, does not handle stack-passed
	 parameters. Bogus!"
	parameterRegs := { a0 . a1 . a2 . a3 . a4 . a5 . a6 . a7 }.
	parameters do: [:parameter | 
		| rReg vReg |

		rReg := parameterRegs at: parameter index.

		vReg := codegen allocateRegister.
		vReg constrainTo: rReg.

		parameter setRegister: vReg.
	].

	automatics := codegen compilation symbolManager lookupSymbolsByType: TRAutomaticSymbol.

	"FIXME: following is bogus as we force all automatics to
	 registers. We need to defer to linages to build a frame
	 and manage spills / reloads."
	automatics do: [:automatic | 
		| vReg |

		vReg := codegen allocateRegister.
		automatic setRegister: vReg.
	].
]

{ #category : #initialization }
TRRV64GPSABILinkage >> initializeWithCodeGenerator: aTRCodeGenerator [ 
	super initializeWithCodeGenerator: aTRCodeGenerator.
	generate := codegen assembler
]
