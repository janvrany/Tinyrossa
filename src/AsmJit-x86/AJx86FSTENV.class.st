"
Floating-Point Store x87 FPU Environment
"
Class {
	#name : #AJx86FSTENV,
	#superclass : #AJx86MemoryInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FSTENV class >> description [
	^ #(#fstenv #mem "op1" 2r1000000 0 "R" 6 "C1" 16r9B0000D9 0 )
]

{ #category : #accessing }
AJx86FSTENV class >> mnemonic [
	^ #fstenv
]

{ #category : #accessing }
AJx86FSTENV >> opCode1 [
	^ 16r9B0000D9
]

{ #category : #accessing }
AJx86FSTENV >> opCode2 [
	^ 16r0
]

{ #category : #accessing }
AJx86FSTENV >> opCodeR [
	^ 16r6
]
