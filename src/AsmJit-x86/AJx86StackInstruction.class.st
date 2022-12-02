"
I am an abstract superclass for assembler instructions that modify the stack directly or indirectly.

Typical operations are call, jump, push and pop.
"
Class {
	#name : #AJx86StackInstruction,
	#superclass : #AJx86NewInstruction,
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #testing }
AJx86StackInstruction class >> isAbstract [
	^ self == AJx86StackInstruction
]

{ #category : #'as yet unclassified' }
AJx86StackInstruction >> checkOperandsForConflict [
	"not required on stack instructions"
]
