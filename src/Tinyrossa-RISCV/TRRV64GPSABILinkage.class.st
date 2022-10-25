"
Implements RISC-V standard ps ABI [1]

[1]: https://github.com/riscv-non-isa/riscv-elf-psabi-doc

"
Class {
	#name : #TRRV64GPSABILinkage,
	#superclass : #TRLinkage,
	#instVars : [
		'generate',
		'frameSize'
	],
	#pools : [
		'TRRV64GRegisters'
	],
	#category : #'Tinyrossa-RISCV-Codegen'
}

{ #category : #accessing }
TRRV64GPSABILinkage >> allocatableRegisters [

	"FIXME: bogus!"
	^ { t0 . t1 . t2 . t3 . t4 . t5 . t6 }
]

{ #category : #'code generation' }
TRRV64GPSABILinkage >> generateEpilogue: valReg [
	generate
		addi: a0, valReg, 0;    "Move value to ABI return register"
		ld: ra, sp, 0;          "Reload link register"
		addi: sp, sp, frameSize;"Destroy the frame"
		jalr: zero, ra, 0.      "Return"
]

{ #category : #'code generation' }
TRRV64GPSABILinkage >> generatePrologue [

	| parameters |

	"Allocate frame"
	generate addi: sp, sp, frameSize negated.

	"Save link register"
	generate sd: sp, ra, 0.

	"Save parameters"
	parameters := codegen compilation symbolManager lookupSymbolsByType: TRParameterSymbol.
	(self mapParameters: parameters) keysAndValuesDo: [ :parameter :paramReg |
		generate sd: sp, paramReg, parameter offset.
	].

	"FIXME: Save preserved registers"
]

{ #category : #initialization }
TRRV64GPSABILinkage >> initializeWithCodeGenerator: aTRCodeGenerator [ 
	super initializeWithCodeGenerator: aTRCodeGenerator.
	generate := codegen assembler.

	"Always save link register."    
	frameSize := 8.
]

{ #category : #mapping }
TRRV64GPSABILinkage >> mapParameters: parameters [ 
	"Map parameters to argument registers.

	 Return a Dictionary mapping parameter to either
	  * machine register if parameter is passed in register
	  * stack offset relative to *caller's* SP if parameter
		is passed on stack."
	
	| parameterMapping |

	parameterMapping := Dictionary new: parameters size.
	parameters do: [:parameter | 
		"For now, only up to 8 integer parameters are supported."
		self assert: parameter type isIntegerType.
		self assert: parameter index <= 8.
		parameterMapping at: parameter put: (self parameterRegisters at: parameter index)
	].
	^ parameterMapping
]

{ #category : #mapping }
TRRV64GPSABILinkage >> mapStack [
	"Compute frame size and map parameters, automatics 
	 and spills to stack slots.

	 The frame looks like: 

	 high address | stack argument N   |  CALLER
				  | ...                |
				  | stack argument 2   |
				  | stack argument 1   | <--- sp upon entry to the function

				  | reg argument N     | 
				  | ...                |      
				  | reg argument 2     |      F
				  | reg argument 1     |      R
											  A
				  | saved reg N        |      M
				  | ...                |      E
				  | saved reg 2        |      
				  | saved reg 1        |

				  | automatic N        |
				  | ...                |
				  | automatic 2        |
				  | automatic 1        |

	  low address | return address     | <--- sp after frame is built

	 For simplicity, all slots are 8 bytes.    
	"

	| offset automatics parameters |

	offset := 8. "Slot at offset 0 is for link register"

	automatics := codegen compilation symbolManager lookupSymbolsByType: TRAutomaticSymbol.
	automatics do: [:automatic | 
		automatic setOffset: offset.
		offset := offset + 8.
	].

	"FIXME: Compute size for saved registers."

	parameters := codegen compilation symbolManager lookupSymbolsByType: TRParameterSymbol.
	parameters do: [:parameter | 
		parameter setOffset: offset.
		offset := offset + 8.
	].

	frameSize := offset
]

{ #category : #accessing }
TRRV64GPSABILinkage >> parameterRegisters [
	^ { a0 . a1 . a2 . a3 . a4 . a5 . a6 . a7 }
]
