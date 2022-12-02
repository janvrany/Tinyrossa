"
Store of Quadword Using Non-Temporal Hint
"
Class {
	#name : #AJx86MOVNTQ,
	#superclass : #AJx86MmuMovInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86MOVNTQ class >> description [
	^ #(#movntq #mmuMov "op1" 2r1000000 "op2" 2r10000 "R" 0 0 "C2" 16r00000FE7 )
]

{ #category : #accessing }
AJx86MOVNTQ class >> mnemonic [
	^ #movntq
]
