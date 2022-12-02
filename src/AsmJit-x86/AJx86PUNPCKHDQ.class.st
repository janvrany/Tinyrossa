"
Unpack and Interlave High-Order Doublewords
"
Class {
	#name : #AJx86PUNPCKHDQ,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PUNPCKHDQ class >> description [
	^ #(#punpckhdq #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000F6A 0 )
]

{ #category : #accessing }
AJx86PUNPCKHDQ class >> mnemonic [
	^ #punpckhdq
]
