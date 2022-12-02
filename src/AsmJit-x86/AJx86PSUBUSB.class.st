"
Subtract Packed Signed Byte Integers with Unsigned Saturation
"
Class {
	#name : #AJx86PSUBUSB,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PSUBUSB class >> description [
	^ #(#psubusb #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FD8 0 )
]

{ #category : #accessing }
AJx86PSUBUSB class >> mnemonic [
	^ #psubusb
]
