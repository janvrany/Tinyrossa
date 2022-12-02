"
Floating-Point Restore x87 FPU, MMX, XMM and MXCSR State
"
Class {
	#name : #AJx86FXRSTOR,
	#superclass : #AJx86MemoryInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FXRSTOR class >> description [
	^ #(#fxrstor #mem 0 0 "R" 1 "C1" 16r00000FAE 0 )
]

{ #category : #accessing }
AJx86FXRSTOR class >> mnemonic [
	^ #fxrstor
]

{ #category : #accessing }
AJx86FXRSTOR >> opCode1 [
	^ 16rFAE
]

{ #category : #accessing }
AJx86FXRSTOR >> opCode2 [
	^ 16r0
]

{ #category : #accessing }
AJx86FXRSTOR >> opCodeR [
	^ 16r1
]
