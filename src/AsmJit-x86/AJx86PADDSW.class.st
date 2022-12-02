"
Add Packed Word Integers with Signed Saturation
"
Class {
	#name : #AJx86PADDSW,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PADDSW class >> description [
	^ #(#paddsw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FED 0 )
]

{ #category : #accessing }
AJx86PADDSW class >> mnemonic [
	^ #paddsw
]
