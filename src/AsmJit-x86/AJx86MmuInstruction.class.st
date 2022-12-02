Class {
	#name : #AJx86MmuInstruction,
	#superclass : #AJx86NewInstruction,
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #testing }
AJx86MmuInstruction class >> isAbstract [
	^ self == AJx86MmuInstruction
]
