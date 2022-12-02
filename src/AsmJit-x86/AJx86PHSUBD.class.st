"
Packed Horizontal Subtract 32bit Signed Integers
"
Class {
	#name : #AJx86PHSUBD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSSE3'
}

{ #category : #accessing }
AJx86PHSUBD class >> description [
	^ #(#phsubd #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r000F3806 0 )
]

{ #category : #accessing }
AJx86PHSUBD class >> mnemonic [
	^ #phsubd
]
