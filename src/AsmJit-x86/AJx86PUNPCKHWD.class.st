"
Unpack and Interlave High-Order Words
"
Class {
	#name : #AJx86PUNPCKHWD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PUNPCKHWD class >> description [
	^ #(#punpckhwd #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000F69 0 )
]

{ #category : #accessing }
AJx86PUNPCKHWD class >> mnemonic [
	^ #punpckhwd
]
