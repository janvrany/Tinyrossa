"
Packed Move 16bit Integers with Zero Extend to 32bit
"
Class {
	#name : #AJx86PMOVZXWD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86PMOVZXWD class >> description [
	^ #(#pmovzxwd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3833 0 )
]

{ #category : #accessing }
AJx86PMOVZXWD class >> mnemonic [
	^ #pmovzxwd
]
