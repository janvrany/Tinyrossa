"
JUMP instruction for the x86-64 instruction set.
"
Class {
	#name : #AJx64JumpInstruction,
	#superclass : #AJx86JumpInstruction,
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #accessing }
AJx64JumpInstruction >> instructionDescriptions [
	^ AJx64InstructionDescription instructions
]
