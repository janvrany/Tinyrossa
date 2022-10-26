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

{ #category : #'code gen-phases' }
TRRV64GCodeGenerator >> fixupBranches [
	generate memory fixupBranchTargets
]

{ #category : #'code gen-phases' }
TRRV64GCodeGenerator >> fixupOffsets [
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
TRRV64GCodeGenerator >> fixupRegisters [
	self fixupUsing: virtualRegisters
]

{ #category : #private }
TRRV64GCodeGenerator >> fixupUsing: aDictionary [
	| insns |

	insns := self instructions.
	1 to: insns size do: [:i | 
		insns at: i put: ((insns at: i) inEnvironment: aDictionary)
	].
]

{ #category : #'code gen-phases' }
TRRV64GCodeGenerator >> generateEpilogues [
	| insns |

	insns := generate memory instructions.
	insns size to: 1 by: -1 do: [:i | 
		| insn |

		insn := insns at: i.
		insn isLeaveInstruction ifTrue: [ 
			generate cursor: i.
			self linkage generateEpilogue: insn value
		].
	].
]

{ #category : #'code gen-phases' }
TRRV64GCodeGenerator >> generatePrologue [
	generate cursor: 0.
	generate label: compilation functionSymbol name.
	self linkage generatePrologue
]

{ #category : #initialization }
TRRV64GCodeGenerator >> initializeWithCompilation: aTRCompilation [
	generate := self assemblerClass new.
	super initializeWithCompilation: aTRCompilation.
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
