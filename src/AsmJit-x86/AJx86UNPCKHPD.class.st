"
Unpack and Interleave High Packed Double-Precision Floating-Point Values
"
Class {
	#name : #AJx86UNPCKHPD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86UNPCKHPD class >> description [
	^ #(#unpckhpd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F15 0 )
]

{ #category : #accessing }
AJx86UNPCKHPD class >> mnemonic [
	^ #unpckhpd
]
