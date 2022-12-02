"
Packed Horizontal Subtract 16bit Signed Integers
"
Class {
	#name : #AJx86PHSUBW,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSSE3'
}

{ #category : #accessing }
AJx86PHSUBW class >> description [
	^ #(#phsubw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r000F3805 0 )
]

{ #category : #accessing }
AJx86PHSUBW class >> mnemonic [
	^ #phsubw
]
