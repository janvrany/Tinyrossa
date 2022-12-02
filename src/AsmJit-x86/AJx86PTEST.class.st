"
Logical Compare
"
Class {
	#name : #AJx86PTEST,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86PTEST class >> description [
	^ #(#ptest #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3817 0 )
]

{ #category : #accessing }
AJx86PTEST class >> mnemonic [
	^ #ptest
]
