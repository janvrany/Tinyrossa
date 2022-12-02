"
I am a 64bit instruction used for the transition of AsmJit to separate instruction classes.
"
Class {
	#name : #AJx64Instruction,
	#superclass : #AJx86Instruction,
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #accessing }
AJx64Instruction >> instructionDescriptions [
	^ AJx64InstructionDescription instructions
]

{ #category : #testing }
AJx64Instruction >> is32BitMode [
	^ false
]

{ #category : #testing }
AJx64Instruction >> is64BitMode [
	^ true
]

{ #category : #testing }
AJx64Instruction >> requiresRex [
	"Answer true if I absolutely must have a REX prefix."

	^ (operands
		detect: [ :rawOp |
			| op |
			op := rawOp asAJOperand.
			op requiresRex | op is64 ]
		ifNone: [ #none ]) ~~ #none
]
