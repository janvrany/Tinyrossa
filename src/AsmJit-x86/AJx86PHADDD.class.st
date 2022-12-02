"
Packed Horizontal Add 32bit Integers
"
Class {
	#name : #AJx86PHADDD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSSE3'
}

{ #category : #accessing }
AJx86PHADDD class >> description [
	^ #(#phaddd #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r000F3802 0 )
]

{ #category : #accessing }
AJx86PHADDD class >> mnemonic [
	^ #phaddd
]
