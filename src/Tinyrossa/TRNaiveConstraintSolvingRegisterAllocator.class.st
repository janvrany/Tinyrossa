Class {
	#name : #TRNaiveConstraintSolvingRegisterAllocator,
	#superclass : #TRRegisterAllocator,
	#category : #'Tinyrossa-Codegen-Register Allocation'
}

{ #category : #allocation }
TRNaiveConstraintSolvingRegisterAllocator >> allocateRegisters [ 
	"
	Following code is bogus, it does not really work.
	Cannot handle running out of registers. Cannot spill.
	Does not handle register liveness. Essentially it does
	work only for very simple cases.
	But hey, it does simulate register allocation and
	it took mi literraly 5 mins to write it :-)
	"

	| realRegisters insns solver |

	insns := codegen instructions.
	realRegisters := codegen linkage allocatableRegisters.
	solver := Z3Solver new.

	"
	First, make sure each virtual register gets mapped to
	some real, allocatable register.
	"
	codegen virtualRegisters do: [:vReg | 
		solver assert: (Bool or: (realRegisters collect: [ :rReg | vReg toInt eq: rReg toInt ])).
	].

	"
	Second, add constraints
	"
	codegen virtualRegisters do: [:vReg |  
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

		used := codegen virtualRegistersUsedBy: insn.
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

		vReg := codegen virtualRegisters at: vRegName.
		rReg := realRegisters detect: [:each | each value = rRegValue value ].
		vReg allocation: rReg.
	].
]
