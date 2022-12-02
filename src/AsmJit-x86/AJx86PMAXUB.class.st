"
Maximum of Packed Unsigned Byte Integers
"
Class {
	#name : #AJx86PMAXUB,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86PMAXUB class >> description [
	^ #(#pmaxub #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FDE 0 )
]

{ #category : #accessing }
AJx86PMAXUB class >> mnemonic [
	^ #pmaxub
]
