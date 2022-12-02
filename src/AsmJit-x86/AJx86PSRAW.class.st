"
Shift Packed Words Right Arithmetic
"
Class {
	#name : #AJx86PSRAW,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PSRAW class >> description [
	^ #(#psraw #mmurmi "op1" 2r110000 "op2" 2r11110000 "R" 4 "C1" 16r00000FE1 "C2" 16r00000F71 )
]

{ #category : #accessing }
AJx86PSRAW class >> mnemonic [
	^ #psraw
]
