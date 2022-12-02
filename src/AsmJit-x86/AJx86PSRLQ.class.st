"
Shift Packed Quadword Right Logical
"
Class {
	#name : #AJx86PSRLQ,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PSRLQ class >> description [
	^ #(#psrlq #mmurmi "op1" 2r110000 "op2" 2r11110000 "R" 2 "C1" 16r00000FD3 "C2" 16r00000F73 )
]

{ #category : #accessing }
AJx86PSRLQ class >> mnemonic [
	^ #psrlq
]
