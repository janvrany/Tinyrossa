"
Convert Packed Doubleword Integers to Packed Single-Precision Floating-Point Values
"
Class {
	#name : #AJx86CVTDQ2PS,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86CVTDQ2PS class >> description [
	^ #(#cvtdq2ps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F5B 0 )
]

{ #category : #accessing }
AJx86CVTDQ2PS class >> mnemonic [
	^ #cvtdq2ps
]
