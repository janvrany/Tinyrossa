"
Add Packed Word Integers
"
Class {
	#name : #AJx86PADDW,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PADDW class >> description [
	^ #(#paddw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FFD 0 )
]

{ #category : #accessing }
AJx86PADDW class >> mnemonic [
	^ #paddw
]
