"
Store Selected Bytes of Quadword
"
Class {
	#name : #AJx86MASKMOVQ,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86MASKMOVQ class >> description [
	^ #(#maskmovq #mmurmi "op1" 2r10000 "op2" 2r10000 "R" 0 "C1" 16r00000FF7 0 )
]

{ #category : #accessing }
AJx86MASKMOVQ class >> mnemonic [
	^ #maskmovq
]
