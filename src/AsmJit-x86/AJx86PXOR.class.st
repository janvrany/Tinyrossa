"
Logical Exclusive OR
"
Class {
	#name : #AJx86PXOR,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PXOR class >> description [
	^ #(#pxor #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FEF 0 )
]

{ #category : #accessing }
AJx86PXOR class >> mnemonic [
	^ #pxor
]
