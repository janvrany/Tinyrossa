"
Monce One Double-Precision Floating-Point Value and Duplicate
"
Class {
	#name : #AJx86MOVDDUP,
	#superclass : #AJx86MmuMovInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE3'
}

{ #category : #accessing }
AJx86MOVDDUP class >> description [
	^ #(#movddup #mmuMov "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF2000F12 0 )
]

{ #category : #accessing }
AJx86MOVDDUP class >> mnemonic [
	^ #movddup
]
