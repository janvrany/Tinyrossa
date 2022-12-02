"
Store Double Quadword Using Non-Temporal Hint
"
Class {
	#name : #AJx86MOVNTDQ,
	#superclass : #AJx86MmuMovInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86MOVNTDQ class >> description [
	^ #(#movntdq #mmuMov "op1" 2r1000000 "op2" 2r100000 "R" 0 0 "C2" 16r66000FE7 )
]

{ #category : #accessing }
AJx86MOVNTDQ class >> mnemonic [
	^ #movntdq
]
