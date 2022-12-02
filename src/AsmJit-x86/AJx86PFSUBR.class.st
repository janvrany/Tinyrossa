"
Packed Floating-Point Subtract Reverse
"
Class {
	#name : #AJx86PFSUBR,
	#superclass : #AJx86MmuRm3DNowInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86PFSUBR class >> description [
	^ #(#pfsubr #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r000000AA )
]

{ #category : #accessing }
AJx86PFSUBR class >> mnemonic [
	^ #pfsubr
]
