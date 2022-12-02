"
Add Packed Quadword Integers
"
Class {
	#name : #AJx86PADDQ,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86PADDQ class >> description [
	^ #(#paddq #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FD4 0 )
]

{ #category : #accessing }
AJx86PADDQ class >> mnemonic [
	^ #paddq
]
