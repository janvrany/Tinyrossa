"
Extract Packed Single-Precision Floating-Point Sing Mask
"
Class {
	#name : #AJx86MOVMSKPS,
	#superclass : #AJx86MmuMovInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86MOVMSKPS class >> description [
	^ #(#movmskps #mmuMov "op1" 2r1101 "op2" 2r100000 "R" 0 "C1" 16r00000F50 0 )
]

{ #category : #accessing }
AJx86MOVMSKPS class >> mnemonic [
	^ #movmskps
]
