"
Packed Floating-Point Reciprocal, Iteration 2
"
Class {
	#name : #AJx86PFRCPIT2,
	#superclass : #AJx86MmuRm3DNowInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86PFRCPIT2 class >> description [
	^ #(#pfrcpit2 #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r000000B6 )
]

{ #category : #accessing }
AJx86PFRCPIT2 class >> mnemonic [
	^ #pfrcpit2
]
