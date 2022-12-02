"
Add Packed Word Integers with Unsigned Saturation
"
Class {
	#name : #AJx86PADDUSW,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PADDUSW class >> description [
	^ #(#paddusw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FDD 0 )
]

{ #category : #accessing }
AJx86PADDUSW class >> mnemonic [
	^ #paddusw
]
