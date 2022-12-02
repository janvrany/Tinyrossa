"
Unpack and Interlave High-Order Quadwords
"
Class {
	#name : #AJx86PUNPCKHQDQ,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86PUNPCKHQDQ class >> description [
	^ #(#punpckhqdq #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F6D 0 )
]

{ #category : #accessing }
AJx86PUNPCKHQDQ class >> mnemonic [
	^ #punpckhqdq
]
