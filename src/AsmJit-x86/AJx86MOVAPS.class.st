"
Move Aligned Packaed Single-Precision Floating-Point Values
"
Class {
	#name : #AJx86MOVAPS,
	#superclass : #AJx86MmuMovInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86MOVAPS class >> description [
	^ #(#movaps #mmuMov "op1" 2r1100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F28 "C2" 16r00000F29 )
]

{ #category : #accessing }
AJx86MOVAPS class >> mnemonic [
	^ #movaps
]
