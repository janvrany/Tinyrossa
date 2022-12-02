"
Move Unaligned Packed Single-Precision Floating-Point Values
"
Class {
	#name : #AJx86MOVUPS,
	#superclass : #AJx86MmuMovInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86MOVUPS class >> description [
	^ #(#movups #mmuMov "op1" 2r1100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F10 "C2" 16r00000F11 )
]

{ #category : #accessing }
AJx86MOVUPS class >> mnemonic [
	^ #movups
]
