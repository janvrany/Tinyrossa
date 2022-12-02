"
Unpack and Interlave Low-Order Bytes
"
Class {
	#name : #AJx86PUNPCKLBW,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PUNPCKLBW class >> description [
	^ #(#punpcklbw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000F60 0 )
]

{ #category : #accessing }
AJx86PUNPCKLBW class >> mnemonic [
	^ #punpcklbw
]
