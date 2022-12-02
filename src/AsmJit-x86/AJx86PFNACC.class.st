"
Packed Floating-Point Negative Accumulate
"
Class {
	#name : #AJx86PFNACC,
	#superclass : #AJx86MmuRm3DNowInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86PFNACC class >> description [
	^ #(#pfnacc #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r0000008A )
]

{ #category : #accessing }
AJx86PFNACC class >> mnemonic [
	^ #pfnacc
]
