"
Packed Move Byte Integers with Zero Extend to 16bit
"
Class {
	#name : #AJx86PMOVZXBW,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86PMOVZXBW class >> description [
	^ #(#pmovzxbw #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3830 0 )
]

{ #category : #accessing }
AJx86PMOVZXBW class >> mnemonic [
	^ #pmovzxbw
]
