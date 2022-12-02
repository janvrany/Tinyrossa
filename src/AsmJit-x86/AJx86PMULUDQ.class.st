"
Multiply Packed Unsigned Doubleword Integers
"
Class {
	#name : #AJx86PMULUDQ,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86PMULUDQ class >> description [
	^ #(#pmuludq #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FF4 0 )
]

{ #category : #accessing }
AJx86PMULUDQ class >> mnemonic [
	^ #pmuludq
]
