"
Pack with Unsigned Saturation: 4 * 64bit to 8 * 32bit
"
Class {
	#name : #AJx86PACKUSDW,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86PACKUSDW class >> description [
	^ #(#packusdw #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F382B 0 )
]

{ #category : #accessing }
AJx86PACKUSDW class >> mnemonic [
	^ #packusdw
]
