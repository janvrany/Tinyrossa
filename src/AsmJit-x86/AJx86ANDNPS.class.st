"
Bitewise Logical AND NOT of Packed Single-Precision Floating-Point Add/Subtract
"
Class {
	#name : #AJx86ANDNPS,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86ANDNPS class >> description [
	^ #(#andnps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F55 0 )
]

{ #category : #accessing }
AJx86ANDNPS class >> mnemonic [
	^ #andnps
]
