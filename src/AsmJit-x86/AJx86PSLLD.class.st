"
Shift Doubleword Left Logical
"
Class {
	#name : #AJx86PSLLD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PSLLD class >> description [
	^ #(#pslld #mmurmi "op1" 2r110000 "op2" 2r11110000 "R" 6 "C1" 16r00000FF2 "C2" 16r00000F72 )
]

{ #category : #accessing }
AJx86PSLLD class >> mnemonic [
	^ #pslld
]
