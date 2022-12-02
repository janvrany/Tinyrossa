"
Packed Floating-Point to Integer Doubleword Conversion
"
Class {
	#name : #AJx86PF2ID,
	#superclass : #AJx86MmuRm3DNowInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86PF2ID class >> description [
	^ #(#pf2id #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r0000001D )
]

{ #category : #accessing }
AJx86PF2ID class >> mnemonic [
	^ #pf2id
]
