"
Packed Floating-Point Compare Greater or Equal
"
Class {
	#name : #AJx86PFCMPGE,
	#superclass : #AJx86MmuRm3DNowInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86PFCMPGE class >> description [
	^ #(#pfcmpge #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r00000090 )
]

{ #category : #accessing }
AJx86PFCMPGE class >> mnemonic [
	^ #pfcmpge
]
