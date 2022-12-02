"
Packed Move 32bit Integers with Sign Extend to 64bit
"
Class {
	#name : #AJx86PMOVSXDQ,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86PMOVSXDQ class >> description [
	^ #(#pmovsxdq #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3825 0 )
]

{ #category : #accessing }
AJx86PMOVSXDQ class >> mnemonic [
	^ #pmovsxdq
]
