"
Multiply Packed Signed Integers and Store High Result
"
Class {
	#name : #AJx86PMULHW,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PMULHW class >> description [
	^ #(#pmulhw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FE5 0 )
]

{ #category : #accessing }
AJx86PMULHW class >> mnemonic [
	^ #pmulhw
]
