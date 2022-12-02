"
Unpack and Interlave Low-Order Doublewords
"
Class {
	#name : #AJx86PUNPCKLDQ,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PUNPCKLDQ class >> description [
	^ #(#punpckldq #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000F62 0 )
]

{ #category : #accessing }
AJx86PUNPCKLDQ class >> mnemonic [
	^ #punpckldq
]
