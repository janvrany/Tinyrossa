"
Move Aligned Packaed Double-Precision Floating-Point Values
"
Class {
	#name : #AJx86MOVAPD,
	#superclass : #AJx86MmuMovInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86MOVAPD class >> description [
	^ #(#movapd #mmuMov "op1" 2r1100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F28 "C2" 16r66000F29 )
]

{ #category : #accessing }
AJx86MOVAPD class >> mnemonic [
	^ #movapd
]
