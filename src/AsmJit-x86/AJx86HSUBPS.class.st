"
Packed Single-Precision Floating-Point Horizontal Subtract
"
Class {
	#name : #AJx86HSUBPS,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE3'
}

{ #category : #accessing }
AJx86HSUBPS class >> description [
	^ #(#hsubps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF2000F7D 0 )
]

{ #category : #accessing }
AJx86HSUBPS class >> mnemonic [
	^ #hsubps
]
