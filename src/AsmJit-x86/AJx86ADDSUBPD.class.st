"
Packed Double-Precision Floating-Point Add/Subtract
"
Class {
	#name : #AJx86ADDSUBPD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE3'
}

{ #category : #accessing }
AJx86ADDSUBPD class >> description [
	^ #(#addsubpd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000FD0 0 )
]

{ #category : #accessing }
AJx86ADDSUBPD class >> mnemonic [
	^ #addsubpd
]
