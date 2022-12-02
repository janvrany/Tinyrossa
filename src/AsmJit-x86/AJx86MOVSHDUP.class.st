"
Move Packed Single-Precision Floating-Point High Quadword and Duplicate
"
Class {
	#name : #AJx86MOVSHDUP,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE3'
}

{ #category : #accessing }
AJx86MOVSHDUP class >> description [
	^ #(#movshdup #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF3000F16 0 )
]

{ #category : #accessing }
AJx86MOVSHDUP class >> mnemonic [
	^ #movshdup
]
