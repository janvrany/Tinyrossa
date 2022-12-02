"
Minimum of Packed Signed Word Integers
"
Class {
	#name : #AJx86PMINSW,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86PMINSW class >> description [
	^ #(#pminsw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FEA 0 )
]

{ #category : #accessing }
AJx86PMINSW class >> mnemonic [
	^ #pminsw
]
