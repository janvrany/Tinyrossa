"
Packed Floating-Point Add
"
Class {
	#name : #AJx86PFADD,
	#superclass : #AJx86MmuRm3DNowInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86PFADD class >> description [
	^ #(#pfadd #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r0000009E )
]

{ #category : #accessing }
AJx86PFADD class >> mnemonic [
	^ #pfadd
]
