"
Move Packed Single-Precision Floating-Point Low Quadword and Duplicate
"
Class {
	#name : #AJx86MOVSLDUP,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE3'
}

{ #category : #accessing }
AJx86MOVSLDUP class >> description [
	^ #(#movsldup #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF3000F12 0 )
]

{ #category : #accessing }
AJx86MOVSLDUP class >> mnemonic [
	^ #movsldup
]
