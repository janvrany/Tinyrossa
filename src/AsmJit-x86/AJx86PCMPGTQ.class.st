"
Compare Packed Signed Quadword Integers for Greater Than
"
Class {
	#name : #AJx86PCMPGTQ,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.2'
}

{ #category : #accessing }
AJx86PCMPGTQ class >> description [
	^ #(#pcmpgtq #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3837 0 )
]

{ #category : #accessing }
AJx86PCMPGTQ class >> mnemonic [
	^ #pcmpgtq
]
