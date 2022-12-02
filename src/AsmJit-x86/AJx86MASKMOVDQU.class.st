"
Store Selected Bytes of Double Quadword
"
Class {
	#name : #AJx86MASKMOVDQU,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86MASKMOVDQU class >> description [
	^ #(#maskmovdqu #mmurmi "op1" 2r100000 "op2" 2r100000 "R" 0 "C1" 16r66000F57 0 )
]

{ #category : #accessing }
AJx86MASKMOVDQU class >> mnemonic [
	^ #maskmovdqu
]
