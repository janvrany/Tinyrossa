"
Packed Move Byte Integers with Sign Extend to 64bit
"
Class {
	#name : #AJx86PMOVSXBQ,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86PMOVSXBQ class >> description [
	^ #(#pmovsxbq #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3822 0 )
]

{ #category : #accessing }
AJx86PMOVSXBQ class >> mnemonic [
	^ #pmovsxbq
]
