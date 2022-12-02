"
Packed Single-Precision Floating-Point Horizontal Add
"
Class {
	#name : #AJx86HADDPS,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE3'
}

{ #category : #accessing }
AJx86HADDPS class >> description [
	^ #(#haddps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF2000F7C 0 )
]

{ #category : #accessing }
AJx86HADDPS class >> mnemonic [
	^ #haddps
]
