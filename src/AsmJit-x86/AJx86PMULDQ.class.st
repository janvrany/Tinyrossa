"
Multiply Packed Signed Doubleword Integers
"
Class {
	#name : #AJx86PMULDQ,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86PMULDQ class >> description [
	^ #(#pmuldq #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3828 0 )
]

{ #category : #accessing }
AJx86PMULDQ class >> mnemonic [
	^ #pmuldq
]
