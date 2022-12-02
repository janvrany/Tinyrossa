"
Packed Floating-Point Maximum
"
Class {
	#name : #AJx86PFMAX,
	#superclass : #AJx86MmuRm3DNowInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86PFMAX class >> description [
	^ #(#pfmax #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r000000A4 )
]

{ #category : #accessing }
AJx86PFMAX class >> mnemonic [
	^ #pfmax
]
