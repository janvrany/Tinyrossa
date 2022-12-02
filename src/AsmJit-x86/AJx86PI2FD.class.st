"
Packed Integer to Floating-Point Doubleword Conversion
"
Class {
	#name : #AJx86PI2FD,
	#superclass : #AJx86MmuRm3DNowInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86PI2FD class >> description [
	^ #(#pi2fd #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r0000000D )
]

{ #category : #accessing }
AJx86PI2FD class >> mnemonic [
	^ #pi2fd
]
