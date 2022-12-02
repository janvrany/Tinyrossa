"
Packed Move 16bit Integers with Sign Extend to 32bit
"
Class {
	#name : #AJx86PMOVSXWD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86PMOVSXWD class >> description [
	^ #(#pmovsxwd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3823 0 )
]

{ #category : #accessing }
AJx86PMOVSXWD class >> mnemonic [
	^ #pmovsxwd
]
