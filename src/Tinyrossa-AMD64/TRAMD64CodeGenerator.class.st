Class {
	#name : #TRAMD64CodeGenerator,
	#superclass : #TRCodeGenerator,
	#category : #'Tinyrossa-AMD64-Codegen'
}

{ #category : #'accessing - config' }
TRAMD64CodeGenerator >> assemblerClass [
	"superclass TRCodeGenerator says that I am responsible to implement this method"

	^ TRAMD64Assembler
]

{ #category : #accessing }
TRAMD64CodeGenerator >> codeBuffer [
	 ^ generate
]

{ #category : #'instance creation' }
TRAMD64CodeGenerator >> createAssembler [
	^ self assemblerClass noStackFrame
]

{ #category : #'accessing - config' }
TRAMD64CodeGenerator >> evaluatorClass [
	"superclass TRCodeGenerator says that I am responsible to implement this method"

	^ TRAMD64CodeEvaluator
]

{ #category : #'code gen-phases' }
TRAMD64CodeGenerator >> fixupBranches [
	"No need to do this - AsmJit itself takes care!"
]

{ #category : #'code gen-phases' }
TRAMD64CodeGenerator >> fixupRegisters [
	self instructions do: [:instruction |
	   instruction isPseudoInstruction ifFalse: [
		   instruction operands withIndexDo: [ :operand :operandIndex |
			   operand isTRVirtualRegister ifTrue: [ 
					instruction operands at: operandIndex put: operand allocation value.
			   ].
			   operand isTRRealRegister ifTrue: [ 
					instruction operands at: operandIndex put: operand value.
			   ].
		   ].
	   ]
   ].
]

{ #category : #accessing }
TRAMD64CodeGenerator >> instructions [
	 ^ generate instructions
]

{ #category : #registers }
TRAMD64CodeGenerator >> virtualRegistersModifiedBy: instruction do: block [
	"Evaluate block for each virtual register modified by
	 given instruction."

	instruction isPseudoInstruction ifTrue: [ ^ self ].

	instruction operands first isTRVirtualRegister ifTrue: [ block value: instruction operands first ]
]

{ #category : #registers }
TRAMD64CodeGenerator >> virtualRegistersReadBy: instruction do: block [
	"Evaluate block for each virtual register read by
	 given instruction."

	instruction isPseudoInstruction ifTrue: [ ^self ].

	instruction operands do: [ :operand | operand isTRVirtualRegister ifTrue:[ block value: operand ] ]
]
