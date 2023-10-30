Class {
	#name : #TRCodeGenerator,
	#superclass : #Object,
	#instVars : [
		'compilation',
		'virtualRegisters',
		'linkage',
		'evaluator',
		'generate',
		'linkRegisterKilled'
	],
	#pools : [
		'TRRegisterKinds'
	],
	#category : #'Tinyrossa-Codegen'
}

{ #category : #'instance creation' }
TRCodeGenerator class >> forCompilation: aTRCompilation [
	^ self basicNew initializeWithCompilation: aTRCompilation
]

{ #category : #'instance creation' }
TRCodeGenerator class >> new [
	self shouldNotImplement. "Use #forCompilation:"
]

{ #category : #registers }
TRCodeGenerator >> allocateRegister [
	^ self allocateRegister: GPR
]

{ #category : #registers }
TRCodeGenerator >> allocateRegister: kind [
	| reg |

	reg := TRVirtualRegister named: (kind name , '_' , (virtualRegisters size + 1) printString) kind: kind.
	virtualRegisters at: reg name put: reg.
	^ reg
]

{ #category : #'code gen-phases' }
TRCodeGenerator >> allocateRegisters [
	| allocator |

	allocator := self registerAllocatorClass forCodeGenerator: self.
	allocator allocateRegisters.
]

{ #category : #accessing }
TRCodeGenerator >> assembler [
	 ^ generate
]

{ #category : #'accessing - config' }
TRCodeGenerator >> assemblerClass [
	^ self subclassResponsibility
]

{ #category : #accessing }
TRCodeGenerator >> codeBuffer [
	^ generate memory
]

{ #category : #accessing }
TRCodeGenerator >> compilation [
	^ compilation
]

{ #category : #'instance creation' }
TRCodeGenerator >> createAssembler [
	^ self assemblerClass new
]

{ #category : #'instance creation' }
TRCodeGenerator >> createEvaluator [
	^ self evaluatorClass forCodeGenerator: self
]

{ #category : #'instance creation' }
TRCodeGenerator >> createLinkage: linkageClass [
	^ linkageClass forCodeGenerator: self
]

{ #category : #accessing }
TRCodeGenerator >> evaluator [
	^ evaluator
]

{ #category : #'accessing - config' }
TRCodeGenerator >> evaluatorClass [
	^ self subclassResponsibility
]

{ #category : #'code gen-phases' }
TRCodeGenerator >> fixupBranches [
	compilation isAOT ifTrue: [
		"Currently AOT generate assembler source (like GCC) to which is in turn
		 assembled into an ELF object file. In this case, we let assembler to 
		 fixup branch offsets.

		 This is especially important on RISC-V as GNU GAS has no option to disable
		 compressed instructions so if we do fixups manually, branch targets would
		 be off!
		"
		^ self    
	].
	generate memory fixupBranchTargets
]

{ #category : #'code gen-phases' }
TRCodeGenerator >> fixupOffsets [
	| parameters automatics offsets |

	automatics := compilation symbolManager lookupSymbolsByType: TRAutomaticSymbol.
	parameters := compilation symbolManager lookupSymbolsByType: TRParameterSymbol.      

	offsets := Dictionary new: automatics size + parameters size.
	parameters do: [:parameter | 
		offsets at: parameter name put: parameter offset.
	].
	automatics do: [:automatic | 
		offsets at: automatic name put: automatic offset.
	].

	self fixupUsing: offsets.
]

{ #category : #'code gen-phases' }
TRCodeGenerator >> fixupRegisters [
	self fixupUsing: virtualRegisters
]

{ #category : #private }
TRCodeGenerator >> fixupUsing: aDictionary [
	| insns |

	insns := self instructions.
	1 to: insns size do: [:i | 
		insns at: i put: ((insns at: i) inEnvironment: aDictionary)
	].
]

{ #category : #'code gen' }
TRCodeGenerator >> generate [
	"Given the TRIL, generate the code into a code buffer.

	This is the main entrypoint that performs all the code generation
	tasks:

	 * instruction selection
	 * register allocation
	 * branch expansion and relocation
	"

	self
		generateCode;
		allocateRegisters;

		mapStack;
		generatePrologue;
		generateEpilogues;

		fixupRegisters;
		fixupOffsets;
		fixupBranches.
]

{ #category : #'code gen-phases' }
TRCodeGenerator >> generateCode [
	"Given the TRIL, generate instruction for it.

	 This is just an instruction selection phase,
	 prologue / epilogues are generated at different
	 phases.
	"
	compilation cfg linearDo: [ :block |
		block treetops do: [:node |
			evaluator evaluate: node
		]
	].
]

{ #category : #'code gen-phases' }
TRCodeGenerator >> generateEpilogues [
	| insns |

	insns := generate memory instructions.
	insns size to: 1 by: -1 do: [:i | 
		| insn |

		insn := insns at: i.
		insn isLeaveInstruction ifTrue: [ 
			[ 
				generate annotations: (Set with: insn node).
				generate cursor: i.
				self linkage generateEpilogue: insn value
			] ensure: [ 
				generate annotations: nil.
			].
		].
	].
]

{ #category : #'code gen-phases' }
TRCodeGenerator >> generatePrologue [
	[
		generate annotations: (Set with: compilation entry treetops first).
		generate cursor: 0.
		generate label: compilation functionSymbol name.
		self linkage generatePrologue    
	] ensure: [
		generate annotations: nil.
	]
]

{ #category : #initialization }
TRCodeGenerator >> initializeWithCompilation: aTRCompilation [ 
	compilation := aTRCompilation.
	virtualRegisters := Dictionary new.
	generate := self createAssembler.
	evaluator := self createEvaluator.
	linkRegisterKilled := false
]

{ #category : #accessing }
TRCodeGenerator >> instructions [
	 ^ generate memory instructions
]

{ #category : #accessing }
TRCodeGenerator >> linkRegisterKilled [
	"Return true, if code contains a call (and therefore 
	 overwrites link register if any)."
	^linkRegisterKilled
]

{ #category : #accessing }
TRCodeGenerator >> linkRegisterKilled: aBoolean [
	"Note whether code contains a call (and therefore
	 overwrites a link register if any)."
	linkRegisterKilled := aBoolean
]

{ #category : #accessing }
TRCodeGenerator >> linkage [
	linkage isNil ifTrue: [ 
		linkage := self createLinkage: compilation functionSymbol linkageClass.
	].
	^ linkage
]

{ #category : #utilities }
TRCodeGenerator >> loadConstant32: value into: reg [
	"Loads 32bit signed integer constant into given register."

	self subclassResponsibility
]

{ #category : #utilities }
TRCodeGenerator >> loadConstant64: value into: reg [
	"Loads 64bit signed integer constant into given register."

	self subclassResponsibility
]

{ #category : #'code gen-phases' }
TRCodeGenerator >> mapStack [
	"Godegen phase: compute frame size and map parameters, automatics 
	 and spills to stack slots."

	self linkage mapStack
]

{ #category : #'accessing - config' }
TRCodeGenerator >> registerAllocatorClass [
	^ compilation config registerAllocatorClass
]

{ #category : #accessing }
TRCodeGenerator >> virtualRegisters [
	^ virtualRegisters
]

{ #category : #registers }
TRCodeGenerator >> virtualRegistersAssignedBy: instruction do: block [ 
	"Evaluate block for each virtual register modified by
	 given instruction."
	
	instruction isProcessorInstruction ifTrue: [
		self virtualRegistersAssignedByProcessorInstruction: instruction do: block.
		^ self.
	].
]

{ #category : #'registers-private' }
TRCodeGenerator >> virtualRegistersAssignedByProcessorInstruction: instruction do: block [ 
	"Evaluate block for each virtual register modified by
	 given processor instruction.

	 DO NOT USE this method directly, use virtualRegistersModifiedBy:do:"
	
	^ self subclassResponsibility
]

{ #category : #registers }
TRCodeGenerator >> virtualRegistersReadBy: instruction do: block [
	"Evaluate block for each virtual register read by
	 given instruction."  
	instruction isProcessorInstruction ifTrue: [ 
		self virtualRegistersReadByProcessorInstruction: instruction do: block.
		^ self.
	].

	instruction isLeaveInstruction ifTrue: [
		"In some cases, leave instruction refer to value in
		 physical (real) register rather then virtual register.

		 One example is when function returns zero and machine
		 has zero register (as it is common on RISCs)."
		instruction value isTRVirtualRegister ifTrue: [
			block value: instruction value
		].
	].
]

{ #category : #'registers-private' }
TRCodeGenerator >> virtualRegistersReadByProcessorInstruction: instruction do: block [
	"Evaluate block for each virtual register read by
	 given processor instruction.

	 DO NOT USE this method directly, use virtualRegistersModifiedBy:do:    
	"  
	^ self subclassResponsibility
]

{ #category : #registers }
TRCodeGenerator >> virtualRegistersUsedBy: instruction [
	| used |

	used := Set new.
	self virtualRegistersReadBy: instruction do: [ :vReg | used add: vReg ].
	self virtualRegistersAssignedBy: instruction do: [:vReg | used add: vReg ].
	^ used
]
