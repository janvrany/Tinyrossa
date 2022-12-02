"
Subtract Packed Signed Byte Integers with Signed Saturation
"
Class {
	#name : #AJx86PSUBSB,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PSUBSB class >> description [
	^ #(#psubsb #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FE8 0 )
]

{ #category : #accessing }
AJx86PSUBSB class >> mnemonic [
	^ #psubsb
]
