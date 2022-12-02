"
Maximum of Packed Signed Byte Integers
"
Class {
	#name : #AJx86PMAXSB,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86PMAXSB class >> description [
	^ #(#pmaxsb #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F383C 0 )
]

{ #category : #accessing }
AJx86PMAXSB class >> mnemonic [
	^ #pmaxsb
]
