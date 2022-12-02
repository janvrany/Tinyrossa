"
Packed Move Byte Integers with Zero Extend to 64bit
"
Class {
	#name : #AJx86PMOVZXBQ,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86PMOVZXBQ class >> description [
	^ #(#pmovzxbq #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3832 0 )
]

{ #category : #accessing }
AJx86PMOVZXBQ class >> mnemonic [
	^ #pmovzxbq
]
