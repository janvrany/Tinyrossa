"
Move Quadword from XMM to MMX Register
"
Class {
	#name : #AJx86MOVDQ2Q,
	#superclass : #AJx86MmuMovInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86MOVDQ2Q class >> description [
	^ #(#movdq2q #mmuMov "op1" 2r10000 "op2" 2r100000 "R" 0 "C1" 16rF2000FD6 0 )
]

{ #category : #accessing }
AJx86MOVDQ2Q class >> mnemonic [
	^ #movdq2q
]
