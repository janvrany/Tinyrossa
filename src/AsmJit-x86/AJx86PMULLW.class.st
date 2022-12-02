"
Multiply Packed Signed Word Integers and Store Low Result
"
Class {
	#name : #AJx86PMULLW,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PMULLW class >> description [
	^ #(#pmullw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FD5 0 )
]

{ #category : #accessing }
AJx86PMULLW class >> mnemonic [
	^ #pmullw
]
