"
Move Byte Mask
"
Class {
	#name : #AJx86PMOVMSKB,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86PMOVMSKB class >> description [
	^ #(#pmovmskb #mmurmi "op1" 2r1100 "op2" 2r110000 "R" 0 "C1" 16r00000FD7 0 )
]

{ #category : #accessing }
AJx86PMOVMSKB class >> mnemonic [
	^ #pmovmskb
]
