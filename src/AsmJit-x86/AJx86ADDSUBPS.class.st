"
Packed Single-Precision Floating-Point Add/Subtract
"
Class {
	#name : #AJx86ADDSUBPS,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE3'
}

{ #category : #accessing }
AJx86ADDSUBPS class >> description [
	^ #(#addsubps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF2000FD0 0 )
]

{ #category : #accessing }
AJx86ADDSUBPS class >> mnemonic [
	^ #addsubps
]
