"
Subtract Packed Quadword Integers
"
Class {
	#name : #AJx86PSUBQ,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86PSUBQ class >> description [
	^ #(#psubq #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FFB 0 )
]

{ #category : #accessing }
AJx86PSUBQ class >> mnemonic [
	^ #psubq
]
