"
Bitwise Logical OR
"
Class {
	#name : #AJx86POR,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86POR class >> description [
	^ #(#por #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FEB 0 )
]

{ #category : #accessing }
AJx86POR class >> mnemonic [
	^ #por
]
