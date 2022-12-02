"
I am an abstract superclass for the x87-extension, floating-point instruction.
"
Class {
	#name : #AJx87Instruction,
	#superclass : #AJx86NewInstruction,
	#pools : [
		'AJConstants'
	],
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #testing }
AJx87Instruction class >> isAbstract [
	^ self = AJx87Instruction
]
