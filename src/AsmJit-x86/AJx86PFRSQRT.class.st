"
Packed Floating-Point Reciprocal Square Root Approximation
"
Class {
	#name : #AJx86PFRSQRT,
	#superclass : #AJx86MmuRm3DNowInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86PFRSQRT class >> description [
	^ #(#pfrsqrt #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r00000097 )
]

{ #category : #accessing }
AJx86PFRSQRT class >> mnemonic [
	^ #pfrsqrt
]
