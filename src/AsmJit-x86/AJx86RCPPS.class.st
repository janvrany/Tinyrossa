"
Compute Reciprocals of Packed Single-Precision Floating-Point Values
"
Class {
	#name : #AJx86RCPPS,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86RCPPS class >> description [
	^ #(#rcpps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F53 0 )
]

{ #category : #accessing }
AJx86RCPPS class >> mnemonic [
	^ #rcpps
]
