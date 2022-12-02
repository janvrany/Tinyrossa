"
Packed Horizontal Add 16bit Integers
"
Class {
	#name : #AJx86PHADDW,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSSE3'
}

{ #category : #accessing }
AJx86PHADDW class >> description [
	^ #(#phaddw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r000F3801 0 )
]

{ #category : #accessing }
AJx86PHADDW class >> mnemonic [
	^ #phaddw
]
