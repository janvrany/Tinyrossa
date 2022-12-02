"
Packed Floating-Point Compare Equal
"
Class {
	#name : #AJx86PFCMPEQ,
	#superclass : #AJx86MmuRm3DNowInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86PFCMPEQ class >> description [
	^ #(#pfcmpeq #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r000000B0 )
]

{ #category : #accessing }
AJx86PFCMPEQ class >> mnemonic [
	^ #pfcmpeq
]
