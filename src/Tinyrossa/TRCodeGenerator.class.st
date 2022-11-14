Class {
	#name : #TRCodeGenerator,
	#superclass : #Object,
	#instVars : [
		'compilation',
		'virtualRegisters',
		'linkage',
		'evaluator'
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
	self subclassResponsibility
]

{ #category : #'code gen-phases' }
TRCodeGenerator >> fixupBranches [
	^ self subclassResponsibility
]

{ #category : #'code gen-phases' }
TRCodeGenerator >> fixupOffsets [
	^ self subclassResponsibility
]

{ #category : #'code gen-phases' }
TRCodeGenerator >> fixupRegisters [
	^ self subclassResponsibility
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
		generateCode: il;
		allocateRegisters;

		mapStack;
		generatePrologue;
		generateEpilogues;

		fixupRegisters;
		fixupOffsets;
		fixupBranches.
]

{ #category : #'code gen-phases' }
TRCodeGenerator >> generateCode: il [
	"Given the TRIL, generate instruction for it.

	 This is just an instruction selection phase,
	 prologue / epilogues are generated at different
	 phases.
	"
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
	linkage := self createLinkage: compilation functionSymbol linkageClass.
	evaluator := self createEvaluator.
]

{ #category : #accessing }
TRCodeGenerator >> instructions [
	self subclassResponsibility
]

{ #category : #accessing }
TRCodeGenerator >> linkage [
	^ linkage
]

{ #category : #'code gen-phases' }
TRCodeGenerator >> mapStack [
	"Godegen phase: compute frame size and map parameters, automatics 
	 and spills to stack slots."

	linkage mapStack
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
