"
Pack with Signed Saturation: 4/8 * 16bit to 8/16 * 8bit
"
Class {
	#name : #AJx86PACKSSWB,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PACKSSWB class >> description [
	^ #(#packsswb #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000F63 0 )
]

{ #category : #accessing }
AJx86PACKSSWB class >> mnemonic [
	^ #packsswb
]
