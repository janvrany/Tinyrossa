"
Bitewise Logical AND of Packed Single-Precision Floating-Point Add/Subtract
"
Class {
	#name : #AJx86ANDPS,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86ANDPS class >> description [
	^ #(#andps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F54 0 )
]

{ #category : #accessing }
AJx86ANDPS class >> mnemonic [
	^ #andps
]
