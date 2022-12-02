"
Bitewise Logical AND NOT of Packed Double-Precision Floating-Point Add/Subtract
"
Class {
	#name : #AJx86ANDNPD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86ANDNPD class >> description [
	^ #(#andnpd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F55 0 )
]

{ #category : #accessing }
AJx86ANDNPD class >> mnemonic [
	^ #andnpd
]
