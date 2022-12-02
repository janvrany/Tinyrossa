"
Move High Packed Single-Precision Floating-Point Quadwords Values
"
Class {
	#name : #AJx86MOVHPS,
	#superclass : #AJx86MmuMovInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86MOVHPS class >> description [
	^ #(#movhps #mmuMov "op1" 2r1100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F16 "C2" 16r00000F17 )
]

{ #category : #accessing }
AJx86MOVHPS class >> mnemonic [
	^ #movhps
]
