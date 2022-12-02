"
Move Unaligned Double Quadword
"
Class {
	#name : #AJx86MOVDQU,
	#superclass : #AJx86MmuMovInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86MOVDQU class >> description [
	^ #(#movdqu #mmuMov "op1" 2r1100000 "op2" 2r1100000 "R" 0 "C1" 16rF3000F6F "C2" 16rF3000F7F )
]

{ #category : #accessing }
AJx86MOVDQU class >> mnemonic [
	^ #movdqu
]
