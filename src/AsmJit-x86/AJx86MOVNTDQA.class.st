"
Load Double Quadword Non-Temporal Aligned Hint
"
Class {
	#name : #AJx86MOVNTDQA,
	#superclass : #AJx86MmuMovInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86MOVNTDQA class >> description [
	^ #(#movntdqa #mmuMov "op1" 2r100000 "op2" 2r1000000 "R" 0 "C1" 16r660F382A 0 )
]

{ #category : #accessing }
AJx86MOVNTDQA class >> mnemonic [
	^ #movntdqa
]
