"
Floating-Point Save x87 FPU, MMX and SSE State
"
Class {
	#name : #AJx86FXSAVE,
	#superclass : #AJx86MemoryInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FXSAVE class >> description [
	^ #(#fxsave #mem 0 0 "R" 0 "C1" 16r00000FAE 0 )
]

{ #category : #accessing }
AJx86FXSAVE class >> mnemonic [
	^ #fxsave
]

{ #category : #accessing }
AJx86FXSAVE >> opCode1 [
	^ 16rFAE
]

{ #category : #accessing }
AJx86FXSAVE >> opCode2 [
	^ 16r0
]

{ #category : #accessing }
AJx86FXSAVE >> opCodeR [
	^ 16r0
]
