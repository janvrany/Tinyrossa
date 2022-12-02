"
Logical AND NOT
"
Class {
	#name : #AJx86PANDN,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PANDN class >> description [
	^ #(#pandn #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FDF 0 )
]

{ #category : #accessing }
AJx86PANDN class >> mnemonic [
	^ #pandn
]
