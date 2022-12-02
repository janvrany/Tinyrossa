"
Multiply and Add Packed Signed and Unsigned Bytes
"
Class {
	#name : #AJx86PMADDUBSW,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSSE3'
}

{ #category : #accessing }
AJx86PMADDUBSW class >> description [
	^ #(#pmaddubsw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r000F3804 0 )
]

{ #category : #accessing }
AJx86PMADDUBSW class >> mnemonic [
	^ #pmaddubsw
]
