"
Packed Move Byte Integers with Zero Extend to 32bit
"
Class {
	#name : #AJx86PMOVZXBD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86PMOVZXBD class >> description [
	^ #(#pmovzxbd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3831 0 )
]

{ #category : #accessing }
AJx86PMOVZXBD class >> mnemonic [
	^ #pmovzxbd
]
