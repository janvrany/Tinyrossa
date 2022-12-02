"
Compute Square Roots of Packed Single-Precision Floating-Point Values
"
Class {
	#name : #AJx86SQRTPS,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86SQRTPS class >> description [
	^ #(#sqrtps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F51 0 )
]

{ #category : #accessing }
AJx86SQRTPS class >> mnemonic [
	^ #sqrtps
]
