"
Add Packed Doubleword Integers
"
Class {
	#name : #AJx86PADDD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PADDD class >> description [
	^ #(#paddd #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FFE 0 )
]

{ #category : #accessing }
AJx86PADDD class >> mnemonic [
	^ #paddd
]
