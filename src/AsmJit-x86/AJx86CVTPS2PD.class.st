"
Convert Packed Single-Precision Floating-Point Values to Packed Double-Precision Floating-Point Values

"
Class {
	#name : #AJx86CVTPS2PD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86CVTPS2PD class >> description [
	^ #(#cvtps2pd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F5A 0 )
]

{ #category : #accessing }
AJx86CVTPS2PD class >> mnemonic [
	^ #cvtps2pd
]
