"
Convert Packed Single-Precision Floating-Point Values to Packed Doubleword Integers

"
Class {
	#name : #AJx86CVTPS2DQ,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86CVTPS2DQ class >> description [
	^ #(#cvtps2dq #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F5B 0 )
]

{ #category : #accessing }
AJx86CVTPS2DQ class >> mnemonic [
	^ #cvtps2dq
]
