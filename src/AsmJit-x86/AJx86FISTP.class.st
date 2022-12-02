"
Floating-Point Store Integer and Pop Register Stack
"
Class {
	#name : #AJx86FISTP,
	#superclass : #AJx87MemoryInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE3'
}

{ #category : #accessing }
AJx86FISTP class >> description [
	^ #(#fistp #x87mem "op1" 2r1110 0 "R" 3 "C1" 16rDFDBDF07 0 )
]

{ #category : #accessing }
AJx86FISTP class >> mnemonic [
	^ #fistp
]

{ #category : #accessing }
AJx86FISTP >> o1Flags [
	^ 16rE
]

{ #category : #accessing }
AJx86FISTP >> opCode1 [
	^ 16rDFDBDF07
]

{ #category : #accessing }
AJx86FISTP >> opCodeR [
	^ 16r3
]
