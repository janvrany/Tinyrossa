Class {
	#name : #TRRV64GCodeGenerator,
	#superclass : #TRCodeGenerator,
	#instVars : [
		'generate'
	],
	#pools : [
		'TRRV64GRegisters'
	],
	#category : #'Tinyrossa-RISCV-Codegen'
}

{ #category : #private }
TRRV64GCodeGenerator >> assembler [
	 ^ generate
]

{ #category : #'accessing-config' }
TRRV64GCodeGenerator >> assemblerClass [
	^ AcDSLRV64GAssembler
]

{ #category : #accessing }
TRRV64GCodeGenerator >> codeBuffer [
	^ generate memory
]

{ #category : #accessing }
TRRV64GCodeGenerator >> compilation [
	^ compilation
]

{ #category : #'accessing-config' }
TRRV64GCodeGenerator >> evaluatorClass [
	^ TRRV64GCodeEvaluator
]

{ #category : #relocation }
TRRV64GCodeGenerator >> fixupBranchTargets [    
	self codeBuffer fixupBranchTargets
]

{ #category : #accessing }
TRRV64GCodeGenerator >> generate [
	^ generate
]

{ #category : #initialization }
TRRV64GCodeGenerator >> initializeWithCompilation: aTRCompilation [
	super initializeWithCompilation: aTRCompilation.
	generate := self assemblerClass new.
]

{ #category : #'accessing-config' }
TRRV64GCodeGenerator >> instructionClass [
	^ TRRV64GInstruction
]

{ #category : #accessing }
TRRV64GCodeGenerator >> instructions [
	^ generate memory instructions.
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
