"
Compare Packed Signed Word Integers for Greater Than
"
Class {
	#name : #AJx86PCMPGTW,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PCMPGTW class >> description [
	^ #(#pcmpgtw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000F65 0 )
]

{ #category : #accessing }
AJx86PCMPGTW class >> mnemonic [
	^ #pcmpgtw
]
