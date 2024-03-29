Class {
	#name : #TRPPC64CodeGenerator,
	#superclass : #TRCodeGenerator,
	#classVars : [
		'MaxDFormImm',
		'MinDFormImm'
	],
	#pools : [
		'TRIntLimits',
		'TRPPC64Registers'
	],
	#category : #'Tinyrossa-POWER-Codegen'
}

{ #category : #initialization }
TRPPC64CodeGenerator class >> initialize [
	MinDFormImm := -16r8000.
	MaxDFormImm :=  16r7FFF.
]

{ #category : #'accessing - config' }
TRPPC64CodeGenerator >> assemblerClass [
	^ AcDSLPPC64Assembler
]

{ #category : #'accessing - config' }
TRPPC64CodeGenerator >> evaluatorClass [
	^ TRPPC64CodeEvaluator
]

{ #category : #queries }
TRPPC64CodeGenerator >> fitsInDFormImm: anInteger [
	^ anInteger between: MinDFormImm and: MaxDFormImm
]

{ #category : #utilities }
TRPPC64CodeGenerator >> loadConstant32: value into: reg [
	self assert: (value between: INT32_MIN and: INT32_MAX).

	(value between: INT16_MIN and: INT16_MAX) ifTrue: [ 
		generate li: reg, value.
	] ifFalse: [ 
		| hi lo |

		lo := (value & 16r0000FFFF).
		hi := (value & 16rFFFFFFFF) >> 16.

		generate lis: reg, hi;
				 ori: reg, reg, lo.
	].
]

{ #category : #utilities }
TRPPC64CodeGenerator >> registerCopyFrom: srcReg to: dstReg [
	generate mr: dstReg, srcReg
]

{ #category : #'registers-private' }
TRPPC64CodeGenerator >> virtualRegistersAssignedByProcessorInstruction: instruction do: block [ 
	self assert: instruction isProcessorInstruction.
	instruction externalBindings 
		keysAndValuesDo: [:name :value | 
			name = 'rt' ifTrue: [
				(value isBitVector and: [ value isSymbolic and: [ value isConstant ] ]) ifTrue: [
					| vReg |

					vReg := virtualRegisters at: value sym ifAbsent: nil.
					block value: vReg.
				].
			].
		].
]

{ #category : #'registers-private' }
TRPPC64CodeGenerator >> virtualRegistersReadByProcessorInstruction: instruction do: block [
	self assert: instruction isProcessorInstruction.

	instruction externalBindings keysAndValuesDo: [ :name :value |
		(#('ra' 'rb' 'rc' 'rs') includes: name) ifTrue: [ 
			(value isBitVector and: [ value isSymbolic and: [ value isConstant ] ]) ifTrue: [ 
				| vReg |

				vReg := virtualRegisters at: value sym ifAbsent: nil.
				block value: vReg.
			].
		].
	].
]
