"
Unpack and Interlave Low-Order Words
"
Class {
	#name : #AJx86PUNPCKLWD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PUNPCKLWD class >> description [
	^ #(#punpcklwd #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000F61 0 )
]

{ #category : #accessing }
AJx86PUNPCKLWD class >> mnemonic [
	^ #punpcklwd
]
