"
Packed Floating-Point Compare Greater Than
"
Class {
	#name : #AJx86PFCMPGT,
	#superclass : #AJx86MmuRm3DNowInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86PFCMPGT class >> description [
	^ #(#pfcmpgt #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r000000A0 )
]

{ #category : #accessing }
AJx86PFCMPGT class >> mnemonic [
	^ #pfcmpgt
]
