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
TRAMD64CodeGenerator >> fixupOffsets [
	"Nothing to do, assembler performs operand fixups"
]

{ #category : #'code gen-phases' }
TRAMD64CodeGenerator >> fixupRegisters [
	"Nothing to do, assembler performs operand fixups"
]

{ #category : #accessing }
TRAMD64CodeGenerator >> instructions [
	 ^ generate instructions
]

{ #category : #utilities }
TRAMD64CodeGenerator >> registerCopyFrom: srcReg to: dstReg [
	"Copy value of source register into destination register"

	generate mov: srcReg -> dstReg
]

{ #category : #'accessing - config' }
TRAMD64CodeGenerator >> virtualRegisterClass [
	^ TRAMD64VirtualRegister
]

{ #category : #'registers-private' }
TRAMD64CodeGenerator >> virtualRegistersAssignedByProcessorInstruction: instruction do: block [
	instruction virtualRegistersAssignedDo: block
]

{ #category : #'registers-private' }
TRAMD64CodeGenerator >> virtualRegistersReadByProcessorInstruction: instruction do: block [
	instruction virtualRegistersReadDo: block
]
