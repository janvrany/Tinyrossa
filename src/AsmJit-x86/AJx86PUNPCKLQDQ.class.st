"
Unpack and Interlave Low-Order Quadwords
"
Class {
	#name : #AJx86PUNPCKLQDQ,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86PUNPCKLQDQ class >> description [
	^ #(#punpcklqdq #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F6C 0 )
]

{ #category : #accessing }
AJx86PUNPCKLQDQ class >> mnemonic [
	^ #punpcklqdq
]
