"
Shift Packed Doublewords Right Arithmetic
"
Class {
	#name : #AJx86PSRAD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PSRAD class >> description [
	^ #(#psrad #mmurmi "op1" 2r110000 "op2" 2r11110000 "R" 4 "C1" 16r00000FE2 "C2" 16r00000F72 )
]

{ #category : #accessing }
AJx86PSRAD class >> mnemonic [
	^ #psrad
]
