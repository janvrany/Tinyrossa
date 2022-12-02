"
Move Low Packed Single-Precision Floating-Point Quadwords Values
"
Class {
	#name : #AJx86MOVLPS,
	#superclass : #AJx86MmuMovInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86MOVLPS class >> description [
	^ #(#movlps #mmuMov "op1" 2r1100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F12 "C2" 16r00000F13 )
]

{ #category : #accessing }
AJx86MOVLPS class >> mnemonic [
	^ #movlps
]
