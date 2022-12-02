"
Copmare Packed Doublewords for Equal
"
Class {
	#name : #AJx86PCMPEQD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PCMPEQD class >> description [
	^ #(#pcmpeqd #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000F76 0 )
]

{ #category : #accessing }
AJx86PCMPEQD class >> mnemonic [
	^ #pcmpeqd
]
