"
Packed Integer To Floating-Point Word Conversion
"
Class {
	#name : #AJx86PI2FW,
	#superclass : #AJx86MmuRm3DNowInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86PI2FW class >> description [
	^ #(#pi2fw #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r0000000C )
]

{ #category : #accessing }
AJx86PI2FW class >> mnemonic [
	^ #pi2fw
]
