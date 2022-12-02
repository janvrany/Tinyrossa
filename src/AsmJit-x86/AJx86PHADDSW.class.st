"
Packed Horizontal Add and Saturate 16bit Integers
"
Class {
	#name : #AJx86PHADDSW,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSSE3'
}

{ #category : #accessing }
AJx86PHADDSW class >> description [
	^ #(#phaddsw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r000F3803 0 )
]

{ #category : #accessing }
AJx86PHADDSW class >> mnemonic [
	^ #phaddsw
]
