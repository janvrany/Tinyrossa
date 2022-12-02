"
Move Packed Single-Precision Floating-Values Low Quadwords to High Quadwords
"
Class {
	#name : #AJx86MOVLHPS,
	#superclass : #AJx86MmuMovInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86MOVLHPS class >> description [
	^ #(#movlhps #mmuMov "op1" 2r100000 "op2" 2r100000 "R" 0 "C1" 16r00000F16 0 )
]

{ #category : #accessing }
AJx86MOVLHPS class >> mnemonic [
	^ #movlhps
]
