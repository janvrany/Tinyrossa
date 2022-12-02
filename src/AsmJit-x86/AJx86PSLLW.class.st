"
Shift Word Left Logical
"
Class {
	#name : #AJx86PSLLW,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PSLLW class >> description [
	^ #(#psllw #mmurmi "op1" 2r110000 "op2" 2r11110000 "R" 6 "C1" 16r00000FF1 "C2" 16r00000F71 )
]

{ #category : #accessing }
AJx86PSLLW class >> mnemonic [
	^ #psllw
]
