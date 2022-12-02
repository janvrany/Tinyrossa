"
Convert Packed Doubleword Integers to Packed Double-Precision Floating-Point Values
"
Class {
	#name : #AJx86CVTPI2PD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86CVTPI2PD class >> description [
	^ #(#cvtpi2pd #mmurmi "op1" 2r100000 "op2" 2r1010000 "R" 0 "C1" 16r66000F2A 0 )
]

{ #category : #accessing }
AJx86CVTPI2PD class >> mnemonic [
	^ #cvtpi2pd
]
