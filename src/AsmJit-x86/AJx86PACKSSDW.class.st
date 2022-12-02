"
Pack with Signed Saturation: 2/4 * 64bit to 4/8 * 32bit
"
Class {
	#name : #AJx86PACKSSDW,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PACKSSDW class >> description [
	^ #(#packssdw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000F6B 0 )
]

{ #category : #accessing }
AJx86PACKSSDW class >> mnemonic [
	^ #packssdw
]
