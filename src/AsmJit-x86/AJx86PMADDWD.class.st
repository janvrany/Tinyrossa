"
Multiply and Add Packed Word Integers
"
Class {
	#name : #AJx86PMADDWD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PMADDWD class >> description [
	^ #(#pmaddwd #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FF5 0 )
]

{ #category : #accessing }
AJx86PMADDWD class >> mnemonic [
	^ #pmaddwd
]
