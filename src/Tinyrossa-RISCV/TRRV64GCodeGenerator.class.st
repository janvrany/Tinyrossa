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

{ #category : #utilities }
TRRV64GCodeGenerator >> loadConstant64: value into: reg [
	self assert: (value between: INT64_MIN and: INT64_MAX).

	"Code below is almost literal translation of code in OMR, see
	 compiler/riscv/codegen/OMRTreeEvaluator.cpp, loadConstant64()."

	(value between: INT32_MIN and: INT32_MAX) ifTrue: [ 
		self loadConstant32: value into: reg.
	] ifFalse: [ 
		| unsigned hi32 nbits toShift bits |

		"Convert value to 'unsigned' (positive) integer - we need to do this
		 because extractBitsFrom:to: expect positive value."
		unsigned := value < 0 ifTrue: [ value + "(1 << 64)hex"16r10000000000000000 ] ifFalse: [ value ].     

		hi32 := unsigned >> 32.

		nbits := RISCV_IMM_BITS - 1.
		toShift := 0.
		bits := 0.

		"Sigh, and convert hi32 back to signed since loadConstant32 takes
		 signed value!"
		hi32 := hi32 > INT32_MAX ifTrue: [ hi32 - "(1 << 32)hex"16r100000000 ] ifFalse: [ hi32 ].
		self loadConstant32: hi32 into: reg.


		bits := unsigned extractBitsFrom: 31 - (0*nbits) to: 31 - (1*nbits) + 1.
		toShift := toShift + (hi32 == 0 ifTrue:[ 0 ] ifFalse: [ nbits ]).
		(bits ~~ 0) ifTrue: [ 
			toShift ~~ 0 ifTrue: [ 
				generate slli: reg, reg, toShift.
			].
			generate addi: reg, reg, bits.
			toShift := 0.
		].

		bits := unsigned extractBitsFrom: 31 - (1*nbits) to: 31 - (2*nbits) + 1.
		toShift := toShift + nbits.
		(bits ~~ 0) ifTrue: [ 
			toShift ~~ 0 ifTrue: [ 
				generate slli: reg, reg, toShift.
			].
			generate addi: reg, reg, bits.
			toShift := 0.
		].

		bits := unsigned extractBitsFrom: 31 - (2*nbits) to: 0.
		toShift := toShift + (31 - (2*nbits) + 1).
		toShift ~~ 0 ifTrue: [ 
			generate slli: reg, reg, toShift.
		].
		(bits ~~ 0) ifTrue: [ 
			generate addi: reg, reg, bits.
		].
	].
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
