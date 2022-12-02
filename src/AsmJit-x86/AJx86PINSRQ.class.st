"
Insert Quadword
"
Class {
	#name : #AJx86PINSRQ,
	#superclass : #AJx86MmuRmiImmediate8BitInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86PINSRQ class >> description [
	^ #(#pinsrq #mmuRmImm8 "op1" 2r100000 "op2" 2r1001000 "R" 0 "C1" 16r660F3A22 0 )
]

{ #category : #accessing }
AJx86PINSRQ class >> mnemonic [
	^ #pinsrq
]
