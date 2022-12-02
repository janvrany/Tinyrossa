"
Compare Packed Doubleword Byte Integers for Greater Than
"
Class {
	#name : #AJx86PCMPGTD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PCMPGTD class >> description [
	^ #(#pcmpgtd #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000F66 0 )
]

{ #category : #accessing }
AJx86PCMPGTD class >> mnemonic [
	^ #pcmpgtd
]
