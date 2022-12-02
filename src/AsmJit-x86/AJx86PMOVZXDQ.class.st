"
Packed Move 32bit Integers with Zero Extend to 64bit
"
Class {
	#name : #AJx86PMOVZXDQ,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86PMOVZXDQ class >> description [
	^ #(#pmovzxdq #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3835 0 )
]

{ #category : #accessing }
AJx86PMOVZXDQ class >> mnemonic [
	^ #pmovzxdq
]
