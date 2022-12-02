"
Shift Packed Word Right Logical
"
Class {
	#name : #AJx86PSRLW,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PSRLW class >> description [
	^ #(#psrlw #mmurmi "op1" 2r110000 "op2" 2r11110000 "R" 2 "C1" 16r00000FD1 "C2" 16r00000F71 )
]

{ #category : #accessing }
AJx86PSRLW class >> mnemonic [
	^ #psrlw
]
