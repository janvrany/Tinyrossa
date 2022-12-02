"
Convert Packed Single-Precision Floating-Point Values to Packed Doubleword Integers
"
Class {
	#name : #AJx86CVTPS2PI,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86CVTPS2PI class >> description [
	^ #(#cvtps2pi #mmurmi "op1" 2r10000 "op2" 2r1100000 "R" 0 "C1" 16r00000F2D 0 )
]

{ #category : #accessing }
AJx86CVTPS2PI class >> mnemonic [
	^ #cvtps2pi
]
