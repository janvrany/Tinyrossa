"
Shift Double Quadword Left Logical
"
Class {
	#name : #AJx86PSLLDQ,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86PSLLDQ class >> description [
	^ #(#pslldq #mmurmi "op1" 2r100000 "op2" 2r10000000 "R" 7 0 "C2" 16r66000F73 )
]

{ #category : #accessing }
AJx86PSLLDQ class >> mnemonic [
	^ #pslldq
]
