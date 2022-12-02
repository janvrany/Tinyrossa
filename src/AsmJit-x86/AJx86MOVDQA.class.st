"
Move Aligned Double Quadword
"
Class {
	#name : #AJx86MOVDQA,
	#superclass : #AJx86MmuMovInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86MOVDQA class >> description [
	^ #(#movdqa #mmuMov "op1" 2r1100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F6F "C2" 16r66000F7F )
]

{ #category : #accessing }
AJx86MOVDQA class >> mnemonic [
	^ #movdqa
]
