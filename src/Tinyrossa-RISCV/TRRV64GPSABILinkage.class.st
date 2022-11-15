"
Implements RISC-V standard ps ABI [1]

[1]: https://github.com/riscv-non-isa/riscv-elf-psabi-doc

"
Class {
	#name : #TRRV64GPSABILinkage,
	#superclass : #TRLinkage,
	#instVars : [
		'frameSize',
		'framePreservedOffset'
	],
	#pools : [
		'TRRV64GRegisters'
	],
	#category : #'Tinyrossa-RISCV-Codegen'
}

{ #category : #accessing }
TRRV64GPSABILinkage >> allocatableRegisters [
	"^ { t0 . t1 . t2 . t3 . t4 . t5 . t6 }"
	^ self preservedRegisters
]

{ #category : #accessing }
TRRV64GPSABILinkage >> allocatedPreservedRegisters [
	| allocated |

	allocated := self allocatedRegisters.
	^ self preservedRegisters select: [:e | allocated includes: e ]
]

{ #category : #'code generation' }
TRRV64GPSABILinkage >> generateCall: node [
	| parameterVregs parameterTypes parameterRregs retVreg|

	parameterVregs := node children collect: [ :child | codegen evaluator evaluate: child ].
	parameterTypes := node children collect: [ :child | child type ].
	parameterRregs := self mapParameters: parameterTypes.

	parameterVregs with: parameterRregs do: [:valReg :paramReg | 
		generate addi: paramReg , valReg, 0
	].

	generate jal: ra, node symbol.

	retVreg := codegen allocateRegister.
	generate addi: retVreg , a0, 0.
	^ retVreg
]

{ #category : #'code generation' }
TRRV64GPSABILinkage >> generateEpilogue: valReg [
	| preserved offset |

	"Move value to ABI return register...
	 ...and reload link register."
	generate
		addi: a0, valReg, 0;
		ld: ra, (sp + 0).      

	"Restore preserved registers"
	offset := framePreservedOffset.
	preserved := self allocatedPreservedRegisters.
	preserved do: [:preservedReg | 
		generate ld: preservedReg, (sp + offset).
		offset := offset + 8.
	].  

	"Destroy the frame...
	 and return."
	generate
		addi: sp, sp, frameSize;"Destroy the frame"
		jalr: zero, ra, 0.      "Return"
]

{ #category : #'code generation' }
TRRV64GPSABILinkage >> generatePrologue [
	| parameters parameterTypes preserved offset |

	"Allocate frame"
	generate addi: sp, sp, frameSize negated.

	"Save link register"
	generate sd: ra, (sp + 0).

	"Save parameters"
	parameters := codegen compilation symbolManager lookupSymbolsByType: TRParameterSymbol.
	parameters := parameters sorted: [ :a :b | a index < b index ].
	parameterTypes := parameters collect: [ :parameter | parameter type ].
	parameters with: (self mapParameters: parameterTypes) do: [ :parameter :paramReg |
		generate sd: paramReg, (sp + parameter offset).
	].

	"Save preserved registers"
	offset := framePreservedOffset.
	preserved := self allocatedPreservedRegisters.
	preserved do: [:preservedReg | 
		generate sd: preservedReg, (sp + offset).
		offset := offset + 8.
	].
]

{ #category : #initialization }
TRRV64GPSABILinkage >> initializeWithCodeGenerator: aTRCodeGenerator [ 
	super initializeWithCodeGenerator: aTRCodeGenerator.

	"Always save link register."    
	frameSize := 8.
	framePreservedOffset := nil.
]

{ #category : #mapping }
TRRV64GPSABILinkage >> mapParameters: parameterTypes [ 
	"Map parameters to argument registers.

	 Return a Dictionary mapping parameter to either
	  * machine register if parameter is passed in register
	  * stack offset relative to *caller's* SP if parameter
		is passed on stack."
	
	| parameterMapping |

	parameterMapping := Array new: parameterTypes size.
	parameterTypes withIndexDo: [:type :index | 
		"For now, only up to 8 integer parameters are supported."
		self assert: type isIntegerType.
		self assert: index <= self parameterRegisters size.
		parameterMapping at: index put: (self parameterRegisters at: index)
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

	| offset automatics preserved parameters |

	offset := 8. "Slot at offset 0 is for link register"

	automatics := codegen compilation symbolManager lookupSymbolsByType: TRAutomaticSymbol.
	automatics do: [:automatic | 
		automatic setOffset: offset.
		offset := offset + 8.
	].

	framePreservedOffset := offset.
	preserved := self allocatedPreservedRegisters.
	offset := offset + (preserved size * 8).

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

{ #category : #accessing }
TRRV64GPSABILinkage >> preservedRegisters [
	^ { s0 . s1 . s2 . s3 . s4 . s5 . s6 . s7 . s8 . s9 . s10 . s11 }
]
