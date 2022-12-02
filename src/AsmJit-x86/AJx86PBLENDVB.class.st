"
Variable Blend Packed Bytes
"
Class {
	#name : #AJx86PBLENDVB,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86PBLENDVB class >> description [
	^ #(#pblendvb #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3810 0 )
]

{ #category : #accessing }
AJx86PBLENDVB class >> mnemonic [
	^ #pblendvb
]
