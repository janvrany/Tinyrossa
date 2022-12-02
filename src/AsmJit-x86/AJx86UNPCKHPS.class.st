"
Unpack and Interleave High Packed Single-Precision Floating-Point Values
"
Class {
	#name : #AJx86UNPCKHPS,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86UNPCKHPS class >> description [
	^ #(#unpckhps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F15 0 )
]

{ #category : #accessing }
AJx86UNPCKHPS class >> mnemonic [
	^ #unpckhps
]
