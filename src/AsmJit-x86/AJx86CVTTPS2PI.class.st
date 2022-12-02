"
Convert with Truncation Packed Single-Precision Floating-Point Values to Packed Doubleword Integers
"
Class {
	#name : #AJx86CVTTPS2PI,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86CVTTPS2PI class >> description [
	^ #(#cvttps2pi #mmurmi "op1" 2r10000 "op2" 2r1100000 "R" 0 "C1" 16r00000F2C 0 )
]

{ #category : #accessing }
AJx86CVTTPS2PI class >> mnemonic [
	^ #cvttps2pi
]
