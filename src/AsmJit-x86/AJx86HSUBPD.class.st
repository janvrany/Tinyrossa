"
Packed Double-Precision Floating-Point Horizontal Subtract
"
Class {
	#name : #AJx86HSUBPD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE3'
}

{ #category : #accessing }
AJx86HSUBPD class >> description [
	^ #(#hsubpd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F7D 0 )
]

{ #category : #accessing }
AJx86HSUBPD class >> mnemonic [
	^ #hsubpd
]
