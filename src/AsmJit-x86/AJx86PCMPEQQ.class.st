"
Copmare Packed Quadwords for Equal
"
Class {
	#name : #AJx86PCMPEQQ,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86PCMPEQQ class >> description [
	^ #(#pcmpeqq #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3829 0 )
]

{ #category : #accessing }
AJx86PCMPEQQ class >> mnemonic [
	^ #pcmpeqq
]
