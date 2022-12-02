Class {
	#name : #TRAMD64SysVLinkage,
	#superclass : #TRLinkage,
	#instVars : [
		'frameSize',
		'framePreservedOffset'
	],
	#pools : [
		'TRAMD64Registers'
	],
	#category : #'Tinyrossa-AMD64-Codegen'
}

{ #category : #accessing }
TRAMD64SysVLinkage >> allocatableRegisters [
	"Return an (ordered) list of registers that are available
	 for register allocation - in order of preference"

	^ self preservedRegisters
]

{ #category : #'code generation' }
TRAMD64SysVLinkage >> generateCall: node [
	"superclass TRLinkage says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #'code generation' }
TRAMD64SysVLinkage >> generateEpilogue: valReg [
	| preserved offset |

	"Move value to ABI return register..."
	generate mov: valReg -> rax.

	"Restore preserved registers"
	offset := framePreservedOffset.
	preserved := self allocatedPreservedRegisters.
	preserved do: [:preservedReg | 
		generate mov: (rbp ptr - offset) -> preservedReg.
		offset := offset - 8.
	].  

	"...restore frame pointer and stack pointer..."
	generate
		mov: rbp -> rsp;
		mov: rbp ptr -> rbp.

	"...and return."
	generate ret.
]

{ #category : #'code generation' }
TRAMD64SysVLinkage >> generatePrologue [
	| parameters parameterTypes preserved offset |

	"Save and update frame pointer"
	generate mov: rbp -> rsp ptr.
	generate mov: rsp -> rbp.

	"Allocate frame"
	generate add: rsp with: frameSize negated.
	

	"Save parameters"
	parameters := codegen compilation symbolManager lookupSymbolsByType: TRParameterSymbol.
	parameters := parameters sorted: [ :a :b | a index < b index ].
	parameterTypes := parameters collect: [ :parameter | parameter type ].
	parameters with: (self mapParameters: parameterTypes) do: [ :parameter :paramReg |
		generate mov: paramReg -> (rbp ptr + parameter offset).
	].

	"Save preserved registers"
	offset := framePreservedOffset.
	preserved := self allocatedPreservedRegisters.
	preserved do: [:preservedReg | 
		generate mov: preservedReg -> (rbp ptr - offset).
		offset := offset - 8.
	].
]

{ #category : #mapping }
TRAMD64SysVLinkage >> mapParameters: parameterTypes [ 
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
TRAMD64SysVLinkage >> mapStack [
	"Compute frame size and map parameters, automatics 
	 and spills to stack slots.

	 The frame looks like: 

	 high address | stack argument N   |  CALLER
				  | ...                |
				  | stack argument 2   |
				  | stack argument 1   | 

				  | return address     | 
				  | saved rbp          | <--- RBP <--- sp upon entry to the function


				  | reg argument 1     | 
				  | reg argument 2     |      
				  | ...                |      F
				  | reg argument 3     |      R
											  A
				  | saved reg 1        |      M
				  | saved reg 2        |      E
				  | ...                |      
				  | saved reg N        |

				  | automatic 1        |
				  | automatic 2        |
				  | ...                |
	  low address | automatic N        | <--- sp after frame is built

	 For simplicity, all slots are 8 bytes.    

	 Also note, that on AMD64 we do use RBP and offsets for parameters/automatics are
	 relative to RBP!
	"

	| offset automatics preserved parameters |

	offset := -8. "Slot at offset 0 is for saved frame pointer (RBP)"

	parameters := codegen compilation symbolManager lookupSymbolsByType: TRParameterSymbol.
	parameters do: [:parameter | 
		parameter setOffset: offset.
		offset := offset - 8.
	].  

	framePreservedOffset := offset.
	preserved := self allocatedPreservedRegisters.
	offset := offset - (preserved size * 8).  

	automatics := codegen compilation symbolManager lookupSymbolsByType: TRAutomaticSymbol.
	automatics do: [:automatic | 
		automatic setOffset: offset.
		offset := offset - 8.
	]. 

	frameSize := offset negated.
]

{ #category : #accessing }
TRAMD64SysVLinkage >> parameterRegisters [
	^ { rdi . rsi. rdx. rcx. r8, r8 }
]

{ #category : #accessing }
TRAMD64SysVLinkage >> preservedRegisters [
	^ { rbx . "rsp . rbp ." r12 . r13 . r14 . r15 }
]
