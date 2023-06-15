Class {
	#name : #TRRV64GCodeGenerator,
	#superclass : #TRCodeGenerator,
	#pools : [
		'TRRV64GRegisters',
		'TRIntLimits',
		'TRRV64GISALimits'
	],
	#category : #'Tinyrossa-RISCV-Codegen'
}

{ #category : #'accessing - config' }
TRRV64GCodeGenerator >> assemblerClass [
	^ AcDSLRV64GAssembler
]

{ #category : #'accessing - config' }
TRRV64GCodeGenerator >> evaluatorClass [
	^ TRRV64GCodeEvaluator
]

{ #category : #queries }
TRRV64GCodeGenerator >> fitsInItypeImm: anInteger [
	^ anInteger between: RISCV_IMM_MIN and: RISCV_IMM_MAX
]

{ #category : #utilities }
TRRV64GCodeGenerator >> loadConstant32: value into: reg [
	self assert: (value between: INT32_MIN and: INT32_MAX).

	"Code below is almost literal translation of code in OMR, see
	 compiler/riscv/codegen/OMRTreeEvaluator.cpp, loadConstant32()."

	(value between: RISCV_IMM_MIN and: RISCV_IMM_MAX) ifTrue: [ 
		generate
			addi: reg, zero, value.
	] ifFalse: [ 
		| lo hi |

		lo := value & (16rFFFFFFFF << RISCV_IMM_BITS) bitInvert32.
		hi := value & (16rFFFFFFFF << RISCV_IMM_BITS).

		(lo & (1 << (RISCV_IMM_BITS - 1))) ~~ 0 ifTrue: [ 
			hi := hi + (1 << RISCV_IMM_BITS). 
		].

		"This is PITA! Here we have to convert unsigned
		 hi and lo to signed values!"
		lo := lo > RISCV_IMM_MAX ifTrue: [ lo - (1 << RISCV_IMM_BITS) ] ifFalse: [ lo ].
		hi := hi > INT32_MAX ifTrue: [ hi - (1 << 32) ] ifFalse: [ hi ].        

		generate
			lui: reg, (hi >> RISCV_IMM_BITS);
			addiw: reg, reg, lo
	].
]
]

{ #category : #registers }
TRRV64GCodeGenerator >> virtualRegistersModifiedBy: instruction do: block [
	"Evaluate block for each virtual register modified by
	 given instruction."

	instruction isPseudoInstruction "such as label" ifTrue: [ 
		^ self
	]. 

	instruction externalBindings keysAndValuesDo: [ :name :value |
		name = 'rd' ifTrue: [ 
			(value isBitVector and: [ value isSymbolic and: [ value isConstant ] ]) ifTrue: [ 
				| vReg |

				vReg := virtualRegisters at: value sym ifAbsent: nil.
				block value: vReg.
			].
		].
	].
]

{ #category : #registers }
TRRV64GCodeGenerator >> virtualRegistersReadBy: instruction do: block [
	"Evaluate block for each virtual register read by
	 given instruction."

	instruction isPseudoInstruction "such as label" ifTrue: [ 
		^ self
	]. 

	instruction externalBindings keysAndValuesDo: [ :name :value |
		(#('rs1' 'rs2' 'rs3') includes: name) ifTrue: [ 
			(value isBitVector and: [ value isSymbolic and: [ value isConstant ] ]) ifTrue: [ 
				| vReg |

				vReg := virtualRegisters at: value sym ifAbsent: nil.
				block value: vReg.
			].
		].
	].
]
