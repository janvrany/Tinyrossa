"
Add Packed Byte Integers with Signed Saturation
"
Class {
	#name : #AJx86PADDSB,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PADDSB class >> description [
	^ #(#paddsb #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FEC 0 )
]

{ #category : #accessing }
AJx86PADDSB class >> mnemonic [
	^ #paddsb
]
