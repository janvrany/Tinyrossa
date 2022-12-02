"
Compute Reciprocals of Square Roots of Packed Single-Precision Floating-Point Values
"
Class {
	#name : #AJx86RSQRTPS,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86RSQRTPS class >> description [
	^ #(#rsqrtps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F52 0 )
]

{ #category : #accessing }
AJx86RSQRTPS class >> mnemonic [
	^ #rsqrtps
]
