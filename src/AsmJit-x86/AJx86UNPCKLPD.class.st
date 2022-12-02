"
Unpack and Interleave Low Packed Double-Precision Floating-Point Values
"
Class {
	#name : #AJx86UNPCKLPD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86UNPCKLPD class >> description [
	^ #(#unpcklpd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F14 0 )
]

{ #category : #accessing }
AJx86UNPCKLPD class >> mnemonic [
	^ #unpcklpd
]
