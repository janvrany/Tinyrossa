Class {
	#name : #TRRV64GCodeGenerator,
	#superclass : #TRCodeGenerator,
	#classVars : [
		'MaxItypeImm',
		'MinItypeImm'
	],
	#pools : [
		'TRRV64GRegisters'
	],
	#category : #'Tinyrossa-RISCV-Codegen'
}

{ #category : #initialization }
TRRV64GCodeGenerator class >> initialize [
	MaxItypeImm :=  16r7FF.
	MinItypeImm := -16r800.
]

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
	^ anInteger between: MinItypeImm and: MaxItypeImm
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
