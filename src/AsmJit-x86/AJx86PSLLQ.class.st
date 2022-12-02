"
Shift Quadword Left Logical
"
Class {
	#name : #AJx86PSLLQ,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PSLLQ class >> description [
	^ #(#psllq #mmurmi "op1" 2r110000 "op2" 2r11110000 "R" 6 "C1" 16r00000FF3 "C2" 16r00000F73 )
]

{ #category : #accessing }
AJx86PSLLQ class >> mnemonic [
	^ #psllq
]
