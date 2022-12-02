"
Packed Floating-Point Accumulate
"
Class {
	#name : #AJx86PFACC,
	#superclass : #AJx86MmuRm3DNowInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86PFACC class >> description [
	^ #(#pfacc #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r000000AE )
]

{ #category : #accessing }
AJx86PFACC class >> mnemonic [
	^ #pfacc
]
