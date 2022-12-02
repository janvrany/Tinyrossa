"
Packed Horizontal Subtract and Saturate 16bit Signed Integers
"
Class {
	#name : #AJx86PHSUBSW,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSSE3'
}

{ #category : #accessing }
AJx86PHSUBSW class >> description [
	^ #(#phsubsw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r000F3807 0 )
]

{ #category : #accessing }
AJx86PHSUBSW class >> mnemonic [
	^ #phsubsw
]
