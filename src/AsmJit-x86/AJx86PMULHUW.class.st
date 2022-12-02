"
Multiply Packed Unsigned Integers and Store High Result
"
Class {
	#name : #AJx86PMULHUW,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86PMULHUW class >> description [
	^ #(#pmulhuw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FE4 0 )
]

{ #category : #accessing }
AJx86PMULHUW class >> mnemonic [
	^ #pmulhuw
]
