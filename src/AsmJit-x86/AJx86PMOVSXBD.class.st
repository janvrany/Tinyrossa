"
Packed Move Byte Integers with Sign Extend to 32bit
"
Class {
	#name : #AJx86PMOVSXBD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86PMOVSXBD class >> description [
	^ #(#pmovsxbd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3821 0 )
]

{ #category : #accessing }
AJx86PMOVSXBD class >> mnemonic [
	^ #pmovsxbd
]
