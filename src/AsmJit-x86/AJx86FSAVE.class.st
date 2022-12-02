"
Floating-Point Store x87 FPU State
"
Class {
	#name : #AJx86FSAVE,
	#superclass : #AJx86MemoryInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FSAVE class >> description [
	^ #(#fsave #mem "op1" 2r1000000 0 "R" 6 "C1" 16r9B0000DD 0 )
]

{ #category : #accessing }
AJx86FSAVE class >> mnemonic [
	^ #fsave
]

{ #category : #accessing }
AJx86FSAVE >> opCode1 [
	^ 16r9B0000DD
]

{ #category : #accessing }
AJx86FSAVE >> opCode2 [
	^ 16r0
]

{ #category : #accessing }
AJx86FSAVE >> opCodeR [
	^ 16r6
]
