"
Packed Move 16bit Integers with Zero Extend to 64bit
"
Class {
	#name : #AJx86PMOVZXWQ,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86PMOVZXWQ class >> description [
	^ #(#pmovzxwq #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3834 0 )
]

{ #category : #accessing }
AJx86PMOVZXWQ class >> mnemonic [
	^ #pmovzxwq
]
