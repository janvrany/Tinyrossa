"
Move Unaligned Packed Double-Precision Floating-Point Values
"
Class {
	#name : #AJx86MOVUPD,
	#superclass : #AJx86MmuMovInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86MOVUPD class >> description [
	^ #(#movupd #mmuMov "op1" 2r1100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F10 "C2" 16r66000F11 )
]

{ #category : #accessing }
AJx86MOVUPD class >> mnemonic [
	^ #movupd
]
