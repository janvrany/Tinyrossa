"
Packed Floating-Point Minimum
"
Class {
	#name : #AJx86PFMIN,
	#superclass : #AJx86MmuRm3DNowInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86PFMIN class >> description [
	^ #(#pfmin #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r00000094 )
]

{ #category : #accessing }
AJx86PFMIN class >> mnemonic [
	^ #pfmin
]
