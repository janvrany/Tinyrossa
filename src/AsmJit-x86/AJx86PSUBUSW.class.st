"
Subtract Packed Signed Word Integers with Unsigned Saturation
"
Class {
	#name : #AJx86PSUBUSW,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PSUBUSW class >> description [
	^ #(#psubusw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FD9 0 )
]

{ #category : #accessing }
AJx86PSUBUSW class >> mnemonic [
	^ #psubusw
]
