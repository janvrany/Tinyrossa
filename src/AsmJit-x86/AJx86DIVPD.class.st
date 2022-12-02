"
Divide Packed Double-Precision Floating-Point Values
"
Class {
	#name : #AJx86DIVPD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86DIVPD class >> description [
	^ #(#divpd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F5E 0 )
]

{ #category : #accessing }
AJx86DIVPD class >> mnemonic [
	^ #divpd
]
