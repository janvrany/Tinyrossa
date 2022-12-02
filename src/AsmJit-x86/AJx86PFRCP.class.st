"
Packed Floating-Point Reciprocal Approximation
"
Class {
	#name : #AJx86PFRCP,
	#superclass : #AJx86MmuRm3DNowInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86PFRCP class >> description [
	^ #(#pfrcp #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r00000096 )
]

{ #category : #accessing }
AJx86PFRCP class >> mnemonic [
	^ #pfrcp
]
