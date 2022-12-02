"
Compute Square Roots of Packed Double-Precision Floating-Point Values
"
Class {
	#name : #AJx86SQRTPD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86SQRTPD class >> description [
	^ #(#sqrtpd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F51 0 )
]

{ #category : #accessing }
AJx86SQRTPD class >> mnemonic [
	^ #sqrtpd
]
