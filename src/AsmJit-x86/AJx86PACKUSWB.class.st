"
Pack with Unsigned Saturation: 4/8 * 32bit to 8/16 * 8bit
"
Class {
	#name : #AJx86PACKUSWB,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PACKUSWB class >> description [
	^ #(#packuswb #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000F67 0 )
]

{ #category : #accessing }
AJx86PACKUSWB class >> mnemonic [
	^ #packuswb
]
