"
Bitwise Logical XOR for Double-Precision Floating-Point Values
"
Class {
	#name : #AJx86XORPD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86XORPD class >> description [
	^ #(#xorpd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F57 0 )
]

{ #category : #accessing }
AJx86XORPD class >> mnemonic [
	^ #xorpd
]
