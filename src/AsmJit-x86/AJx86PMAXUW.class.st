"
Maximum of Packed Unsigned Word Integers
"
Class {
	#name : #AJx86PMAXUW,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86PMAXUW class >> description [
	^ #(#pmaxuw #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F383E 0 )
]

{ #category : #accessing }
AJx86PMAXUW class >> mnemonic [
	^ #pmaxuw
]
