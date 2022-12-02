"
Packed Double-Precision Floating-Point Horizontal Add
"
Class {
	#name : #AJx86HADDPD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE3'
}

{ #category : #accessing }
AJx86HADDPD class >> description [
	^ #(#haddpd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F7C 0 )
]

{ #category : #accessing }
AJx86HADDPD class >> mnemonic [
	^ #haddpd
]
