"
Shift Packed Doublewords Right Logical
"
Class {
	#name : #AJx86PSRLD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PSRLD class >> description [
	^ #(#psrld #mmurmi "op1" 2r110000 "op2" 2r11110000 "R" 2 "C1" 16r00000FD2 "C2" 16r00000F72 )
]

{ #category : #accessing }
AJx86PSRLD class >> mnemonic [
	^ #psrld
]
