"
Compare Packed Signed Byte Integers for Greater Than
"
Class {
	#name : #AJx86PCMPGTB,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PCMPGTB class >> description [
	^ #(#pcmpgtb #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000F64 0 )
]

{ #category : #accessing }
AJx86PCMPGTB class >> mnemonic [
	^ #pcmpgtb
]
