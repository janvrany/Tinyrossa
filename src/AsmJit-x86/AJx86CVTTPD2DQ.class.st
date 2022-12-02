"
Convert with Truncation Packed Double-Precision Floating-Point Values to Packed Doubleword Integers
"
Class {
	#name : #AJx86CVTTPD2DQ,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86CVTTPD2DQ class >> description [
	^ #(#cvttpd2dq #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000FE6 0 )
]

{ #category : #accessing }
AJx86CVTTPD2DQ class >> mnemonic [
	^ #cvttpd2dq
]
