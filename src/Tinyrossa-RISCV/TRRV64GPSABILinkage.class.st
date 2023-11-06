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
		'TRDataTypes',
		'TRIntLimits',
		'TRRV64GRegisters'
	],
	#category : #'Tinyrossa-RISCV-Codegen'
}

{ #category : #accessing }
TRRV64GPSABILinkage >> allocatableRegisters [
	codegen linkRegisterKilled ifFalse:[
		"For leaf methods, we prefer volatile registers over preserved 
		 registers. This saves us a need to save / reload (preserved) 
		 registers in prologue / epilogue."

		^ self volatileRegisters , self preservedRegisters
	] ifTrue:[
		"FIXME: For non-leaf methods, we only allow to use preserved registers 
		 because as of now, there's no support for spilling / reloading 
		 registers in the code (only in prologue / epilogue)."

		^ self preservedRegisters
	]
]

{ #category : #accessing }
TRRV64GPSABILinkage >> allocatedPreservedRegisters [
	| allocated |

	allocated := self allocatedRegisters.
	^ self preservedRegisters select: [:e | allocated includes: e ]
]

{ #category : #'code generation' }
TRRV64GPSABILinkage >> generateCall: node [
	"Also handles indirect calls."
	| indirect deps firstParameterIndex parameterVregs parameterTypes parameterRregs call retVreg |

	indirect := node opcode isIndirect.
	deps := TRRegisterDependencies new.

	"Step 1: collect parameters and map parameters to parameter registers
	 (and stack slots, thought that's not supported yet)"

	"If this is an indirect call, the first child is the address of the callee."
	firstParameterIndex := indirect ifTrue: [ 2 ] ifFalse: [ 1 ].

	parameterVregs := Array new: node children size - firstParameterIndex + 1.
	parameterTypes := Array new: node children size - firstParameterIndex + 1.

	firstParameterIndex to: node children size do: [:i | 
		| parameter |

		parameter := node children at: i.
		parameterVregs at: i - firstParameterIndex + 1 
					  put: (codegen evaluator evaluate: parameter).
		parameterTypes at: i - firstParameterIndex + 1 
					  put: parameter type.
	].
	parameterRregs := self mapParameters: parameterTypes.

	"Step 2: map parameters into parameter registers and
	 thrash all other unused parameter registers and volatile
	 registers."
	parameterVregs with: parameterRregs do: [:vReg :rReg |
		generate addi: rReg, vReg, 0.
		deps pre addDependency: vReg on: rReg. 
		rReg ~~ a0 ifTrue: [
			deps post addDependency: vReg on: rReg.
		]
	].
	self parameterRegisters do: [:rReg |  
		(parameterRregs includes: rReg) ifFalse: [  
			deps pre addTrashed: rReg. 
			deps post addTrashed: rReg.
		].
	].
	self volatileRegisters do: [:rReg | 
		deps pre addTrashed: rReg.
		deps post addTrashed: rReg.
	].

	"Step 3: generate all instruction"
	indirect ifTrue: [ 
		| addrReg |

		addrReg := codegen evaluator evaluate: node child1.
		call := generate jalr: ra, addrReg, 0.
	] ifFalse: [
		"If the call a recursive call..."
		node symbol == codegen compilation functionSymbol ifTrue: [ 
			"...then generate 'jal ra, <function>'..."
			call := generate jal: ra, node symbol.
		] ifFalse: [
			"...otherwise..."
			codegen compilation isAOT ifTrue: [ 
				"
				In AOT mode we generate call and let the (runtime) linker 
				to properly relocate it.
				"
				call := generate call: node symbol
			] ifFalse: [ 
				"
				In JIT mode we load address directly into 'ra' 
				(as opposite to allocating new v-register as in indirect case
				above) because will be clobbered anyways by jalr storing return 
				address. This lowers the pressure on RA.

				Also note that rather than this, we should generate a trampoline
				and call calle through it. Or relative jal if it's close enough. 
				That's left as future work.
				"
				self assert: node symbol address notNil description: 'No address set for function symbol'.

				codegen loadConstant64: node symbol address into: ra.
				call := generate jalr: ra, ra, 0.
			].
		].
	].
	call dependencies: deps.


	"Note that link register has been overwritten"
	codegen linkRegisterKilled: true.
	
	"Step 4: map return value into return register (if any) and finish"
	node symbol type == Void ifTrue:[
		retVreg := nil.
	] ifFalse:[
		retVreg := codegen allocateRegister.
		generate addi: retVreg , a0, 0.
		deps post addDependency: retVreg on: a0.
	].

	^ retVreg
]

{ #category : #'code generation' }
TRRV64GPSABILinkage >> generateCallIndirect: node [
	^ self generateCall: node
]

{ #category : #'code generation' }
TRRV64GPSABILinkage >> generateEpilogue: valReg [
	| preserved offset |

	"Move value to ABI return register..."
	generate addi: a0, valReg, 0.

	"...and reload link register if needed."
	codegen linkRegisterKilled ifTrue:[
		generate ld: ra, (sp + 0).
	].

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
	codegen linkRegisterKilled ifTrue:[
		generate sd: ra, (sp + 0).
	].

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

{ #category : #'code generation' }
TRRV64GPSABILinkage >> generateReturn: node [
	| srcReg leave deps |

	self assert: codegen compilation functionType == node child1 type.

	srcReg := codegen evaluator evaluate: node child1.

	deps := TRRegisterDependencies new.
	deps pre addDependency: srcReg on: a0.

	leave := generate leave: srcReg.   
	leave dependencies: deps.

	^ nil
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
		automatic isUsed ifTrue: [
			automatic setOffset: offset.
			offset := offset + 8.
		].
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

{ #category : #accessing }
TRRV64GPSABILinkage >> volatileRegisters [
	^ { t0 . t1 . t2 . t3 . t4 . t5 . t6 }
]
