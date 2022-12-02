"
Store Doubleword Using Non-Temporal Hint
"
Class {
	#name : #AJx86MOVNTI,
	#superclass : #AJx86MmuMovInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86MOVNTI class >> description [
	^ #(#movnti #mmuMov "op1" 2r1000000 "op2" 2r1100 "R" 0 0 "C2" 16r00000FC3 )
]

{ #category : #accessing }
AJx86MOVNTI class >> mnemonic [
	^ #movnti
]
