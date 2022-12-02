"
Maximum of Packed Unsigned Doubleword Integers
"
Class {
	#name : #AJx86PMAXUD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86PMAXUD class >> description [
	^ #(#pmaxud #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F383F 0 )
]

{ #category : #accessing }
AJx86PMAXUD class >> mnemonic [
	^ #pmaxud
]
