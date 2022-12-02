"
Bitewise Logical AND of Packed Double-Precision Floating-Point Add/Subtract
"
Class {
	#name : #AJx86ANDPD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86ANDPD class >> description [
	^ #(#andpd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F54 0 )
]

{ #category : #accessing }
AJx86ANDPD class >> mnemonic [
	^ #andpd
]
