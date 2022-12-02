"
Convert Packed Doubleword Integers to Packed Double-Precision Floating-Point Values
"
Class {
	#name : #AJx86CVTDQ2PD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86CVTDQ2PD class >> description [
	^ #(#cvtdq2pd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF3000FE6 0 )
]

{ #category : #accessing }
AJx86CVTDQ2PD class >> mnemonic [
	^ #cvtdq2pd
]
