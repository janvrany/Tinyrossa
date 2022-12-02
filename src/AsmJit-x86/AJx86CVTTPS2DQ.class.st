"
Convert with Truncation Packed Single-Precision Floating-Point Values to Packed Doubleword Integers
"
Class {
	#name : #AJx86CVTTPS2DQ,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86CVTTPS2DQ class >> description [
	^ #(#cvttps2dq #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF3000F5B 0 )
]

{ #category : #accessing }
AJx86CVTTPS2DQ class >> mnemonic [
	^ #cvttps2dq
]
