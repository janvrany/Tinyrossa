"
Packed Floating-Point to Integer Word Conversion
"
Class {
	#name : #AJx86PF2IW,
	#superclass : #AJx86MmuRm3DNowInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86PF2IW class >> description [
	^ #(#pf2iw #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r0000001C )
]

{ #category : #accessing }
AJx86PF2IW class >> mnemonic [
	^ #pf2iw
]
