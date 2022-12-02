"
Insert Doubleword
"
Class {
	#name : #AJx86PINSRD,
	#superclass : #AJx86MmuRmiImmediate8BitInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86PINSRD class >> description [
	^ #(#pinsrd #mmuRmImm8 "op1" 2r100000 "op2" 2r1000100 "R" 0 "C1" 16r660F3A22 0 )
]

{ #category : #accessing }
AJx86PINSRD class >> mnemonic [
	^ #pinsrd
]
