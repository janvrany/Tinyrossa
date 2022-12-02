"
Minimum of Packed Unsigned Doubleword Integers
"
Class {
	#name : #AJx86PMINUD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86PMINUD class >> description [
	^ #(#pminud #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F383B 0 )
]

{ #category : #accessing }
AJx86PMINUD class >> mnemonic [
	^ #pminud
]
