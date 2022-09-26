Class {
	#name : #TRCodeGenerator,
	#superclass : #Object,
	#instVars : [
		'compilation',
		'virtualRegisters'
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
TRCodeGenerator >> allocatableRegisters [
	"Return a collection of machine registers that can be
	 allocated"

	self subclassResponsibility.
]

{ #category : #registers }
TRCodeGenerator >> allocateRegister [
	| reg |

	reg := TRVirtualRegister named: ('VR_' , (virtualRegisters size + 1) printString).
	virtualRegisters at: reg name put: reg.
	^ reg
]

{ #category : #registers }
TRCodeGenerator >> allocateRegisters [
	"
	Following code is bogus, it does not really work.
	Cannot handle running out of registers. Cannot spill.
	Does not handle register liveness. Essentially it does
	work only for very simple cases.

	But hey, it does simulate register allocation and
	it took mi literraly 5 mins to write it :-)
	"

	| realRegisters insns solver |

	insns := self instructions.
	realRegisters := self allocatableRegisters.
	solver := Z3Solver new.

	"
	First, make sure each virtual register gets mapped to
	some real, allocatable register.
	"
	virtualRegisters do: [:vReg | 
		solver assert: (Bool or: (realRegisters collect: [ :rReg | vReg toInt eq: rReg toInt ])).
	].

	"
	Second, add constraints
	"
	virtualRegisters do: [:vReg |  
		vReg constraints do: [:rReg |  
			solver assert: (vReg toInt eq: rReg toInt)
		].
	].

	"
	Third, make sure that mapping has no conflicts.

	Following code is absolutely bogus as it does not
	take liveness into an account, but will do for now.
	"
	insns do: [:insn | 
		| used |

		used := self virtualRegistersUsedBy: insn.
		used do: [:usedReg1 | used do: [:usedReg2 | 
			usedReg1 ~~ usedReg2 ifTrue: [ 
				solver assert: (usedReg1 toInt eq: usedReg2 toInt) not
			].
		]].
	].


	solver check ifFalse: [ 
		self error: 'I give up, you''d better ask mr Chaitin help you here!'
	].

	solver getModel constants keysAndValuesDo: [:vRegName :rRegValue | 
		| vReg rReg |

		vReg := virtualRegisters at: vRegName.
		rReg := realRegisters detect: [:each | each value = rRegValue value ].
		vReg allocation: rReg.
	].

	"
	Now, we just walk over instrictions and replace symbolic 
	registers with allocated ones.
	"
	1 to: insns size do: [:i | 
		insns at: i put: ((insns at: i) inEnvironment: virtualRegisters)
	].
]

{ #category : #accessing }
TRCodeGenerator >> evaluatorClass [
	self subclassResponsibility
]

{ #category : #relocation }
TRCodeGenerator >> fixupBranchTargets [    
	^ self shouldImplement
]

{ #category : #'code generation' }
TRCodeGenerator >> generateCode: il [
	| evaluator |

	evaluator := self evaluatorClass forCodeGenerator: self.
	il do: [:node | evaluator evaluate: node ].
]

{ #category : #'code generation' }
TRCodeGenerator >> generateEpilogue: retReg [
	self subclassResponsibility
]

{ #category : #'code generation' }
TRCodeGenerator >> generatePrologue [
	self subclassResponsibility
]

{ #category : #initialization }
TRCodeGenerator >> initializeWithCompilation: aTRCompilation [
	compilation := aTRCompilation.
	virtualRegisters := Dictionary new.
]

{ #category : #accessing }
TRCodeGenerator >> instructions [
	self subclassResponsibility
]

{ #category : #registers }
TRCodeGenerator >> virtualRegistersUsedBy: instruction [
	| used |

	instruction isPseudoInstruction "such as label" ifTrue: [ 
		^ #()
	].

	used := Set new.
	instruction externalBindingValues do: [ :value |
		(value isAST and: [ value isSymbolic and: [ value isConstant ] ]) ifTrue: [ 
			| vReg |

			vReg := virtualRegisters at: value sym ifAbsent: nil.
			vReg notNil ifTrue: [ used add: vReg ]
		].
	].
	^ used
]
