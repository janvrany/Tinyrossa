"
Load Unaligned 128 Bit Integer
"
Class {
	#name : #AJx86LDDQU,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE3'
}

{ #category : #accessing }
AJx86LDDQU class >> description [
	^ #(#lddqu #mmurmi "op1" 2r100000 "op2" 2r1000000 "R" 0 "C1" 16rF2000FF0 0 )
]

{ #category : #accessing }
AJx86LDDQU class >> mnemonic [
	^ #lddqu
]
