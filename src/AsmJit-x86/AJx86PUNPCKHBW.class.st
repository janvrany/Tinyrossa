"
Unpack and Interlave High-Order Bytes
"
Class {
	#name : #AJx86PUNPCKHBW,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PUNPCKHBW class >> description [
	^ #(#punpckhbw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000F68 0 )
]

{ #category : #accessing }
AJx86PUNPCKHBW class >> mnemonic [
	^ #punpckhbw
]
