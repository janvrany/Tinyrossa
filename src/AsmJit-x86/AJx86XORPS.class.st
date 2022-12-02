"
Bitwise Logical XOR for Single-Precision Floating-Point Values
"
Class {
	#name : #AJx86XORPS,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86XORPS class >> description [
	^ #(#xorps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F57 0 )
]

{ #category : #accessing }
AJx86XORPS class >> mnemonic [
	^ #xorps
]
