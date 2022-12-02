"
Convert Packed Doubleword Integers to Packed Single-Precision Floating-Point Values

"
Class {
	#name : #AJx86CVTPI2PS,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86CVTPI2PS class >> description [
	^ #(#cvtpi2ps #mmurmi "op1" 2r100000 "op2" 2r1010000 "R" 0 "C1" 16r00000F2A 0 )
]

{ #category : #accessing }
AJx86CVTPI2PS class >> mnemonic [
	^ #cvtpi2ps
]
