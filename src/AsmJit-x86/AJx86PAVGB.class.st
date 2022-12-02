"
Average Packed Byte Integers
"
Class {
	#name : #AJx86PAVGB,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86PAVGB class >> description [
	^ #(#pavgb #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FE0 0 )
]

{ #category : #accessing }
AJx86PAVGB class >> mnemonic [
	^ #pavgb
]
