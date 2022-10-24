Class {
	#name : #TRCodeGenerator,
	#superclass : #Object,
	#instVars : [
		'compilation',
		'virtualRegisters',
		'linkage'
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
	| reg |

	reg := TRVirtualRegister named: ('VR_' , (virtualRegisters size + 1) printString).
	virtualRegisters at: reg name put: reg.
	^ reg
]

{ #category : #'code gen-phases' }
TRCodeGenerator >> allocateRegisters [
	| allocator insns |

	allocator := self registerAllocatorClass forCodeGenerator: self.
	allocator allocateRegisters.
	"
	Now, we just walk over instructions and replace symbolic 
	registers with allocated ones.
	"
	insns := self instructions.
	1 to: insns size do: [:i | 
		insns at: i put: ((insns at: i) inEnvironment: virtualRegisters)
	].
]

{ #category : #'accessing - config' }
TRCodeGenerator >> evaluatorClass [
	self subclassResponsibility
]

{ #category : #'code gen-phases' }
TRCodeGenerator >> fixupBranchTargets [    
	^ self shouldImplement
]

{ #category : #'code gen' }
TRCodeGenerator >> generate: il [
	"Given the TRIL, generate the code into a code buffer.

	This is the main entrypoint that performs all the code generation
	tasks:

	 * instruction selection
	 * register allocation
	 * branch expansion and relocation
	"

	self
		mapParametersAndAutomatics;
		generateCode: il;
		allocateRegisters;

		generatePrologue;
		generateEpilogues;

		fixupBranchTargets.
]

{ #category : #'code gen-phases' }
TRCodeGenerator >> generateCode: il [
	"Given the TRIL, generate instruction for it.

	 This is just an instruction selection phase,
	 prologue / epilogues are generated at different
	 phases.
	"
	| evaluator |

	evaluator := self evaluatorClass forCodeGenerator: self.
	il do: [:node | evaluator evaluate: node ].
]

{ #category : #'code gen-phases' }
TRCodeGenerator >> generateEpilogues [
	self subclassResponsibility
]

{ #category : #'code gen-phases' }
TRCodeGenerator >> generatePrologue [
	self subclassResponsibility
]

{ #category : #initialization }
TRCodeGenerator >> initializeWithCompilation: aTRCompilation [
	compilation := aTRCompilation.
	virtualRegisters := Dictionary new.
	linkage := self linkageClass forCodeGenerator: self.
]

{ #category : #accessing }
TRCodeGenerator >> instructions [
	self subclassResponsibility
]

{ #category : #accessing }
TRCodeGenerator >> linkage [
	^ linkage
]

{ #category : #'accessing - config' }
TRCodeGenerator >> linkageClass [
	^ compilation functionSymbol linkageClass
]

{ #category : #'code gen-phases' }
TRCodeGenerator >> mapParametersAndAutomatics [
	"Godegen phase: map parameters and automatics to
	 stack slots."

	linkage
		mapParameters;
		mapAutomatics.
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
TRCodeGenerator >> virtualRegistersModifiedBy: instruction do: block [
	 "Evaluate block for each virtual register modified by
	  given instruction."  
	^ self subclassResponsibility
]

{ #category : #registers }
TRCodeGenerator >> virtualRegistersReadBy: instruction do: block [
	 "Evaluate block for each virtual register read by
	  given instruction."  
	^ self subclassResponsibility
]

{ #category : #registers }
TRCodeGenerator >> virtualRegistersUsedBy: instruction [
	| used |

	instruction isPseudoInstruction "such as label" ifTrue: [ 
		^ #()
	].

	used := Set new.
	self virtualRegistersReadBy: instruction do: [ :vReg | used add: vReg ].
	self virtualRegistersModifiedBy: instruction do: [ :vReg | used add: vReg ].
]
