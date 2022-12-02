"
Average Packed Word Integers
"
Class {
	#name : #AJx86PAVGW,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86PAVGW class >> description [
	^ #(#pavgw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FE3 0 )
]

{ #category : #accessing }
AJx86PAVGW class >> mnemonic [
	^ #pavgw
]
