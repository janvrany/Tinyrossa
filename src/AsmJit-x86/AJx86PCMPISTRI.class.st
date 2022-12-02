"
Packed Compare Implicit Length Strings, Return Index
"
Class {
	#name : #AJx86PCMPISTRI,
	#superclass : #AJx86MmuRmiImmediate8BitInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.2'
}

{ #category : #accessing }
AJx86PCMPISTRI class >> description [
	^ #(#pcmpistri #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3A63 0 )
]

{ #category : #accessing }
AJx86PCMPISTRI class >> mnemonic [
	^ #pcmpistri
]
