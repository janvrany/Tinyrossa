"
I am the general superclass for the x87 FPU Status Word instructions.
"
Class {
	#name : #AJx87FstswInstruction,
	#superclass : #AJx87Instruction,
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #accessing }
AJx87FstswInstruction class >> arity [
	^ 1 to: 1
]

{ #category : #accessing }
AJx87FstswInstruction class >> group [
	^ #x87fstsw
]

{ #category : #testing }
AJx87FstswInstruction class >> isAbstract [
	^ self == AJx87FstswInstruction
]
