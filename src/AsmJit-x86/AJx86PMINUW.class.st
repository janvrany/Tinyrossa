"
Minimum of Packed Unsigned Word Integers
"
Class {
	#name : #AJx86PMINUW,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86PMINUW class >> description [
	^ #(#pminuw #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F383A 0 )
]

{ #category : #accessing }
AJx86PMINUW class >> mnemonic [
	^ #pminuw
]
