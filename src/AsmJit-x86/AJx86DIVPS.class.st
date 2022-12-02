"
Divide Packed Single-Precision Floating-Point Values
"
Class {
	#name : #AJx86DIVPS,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86DIVPS class >> description [
	^ #(#divps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F5E 0 )
]

{ #category : #accessing }
AJx86DIVPS class >> mnemonic [
	^ #divps
]
