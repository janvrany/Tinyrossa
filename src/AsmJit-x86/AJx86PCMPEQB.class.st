"
Copmare Packed Bytes for Equal
"
Class {
	#name : #AJx86PCMPEQB,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PCMPEQB class >> description [
	^ #(#pcmpeqb #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000F74 0 )
]

{ #category : #accessing }
AJx86PCMPEQB class >> mnemonic [
	^ #pcmpeqb
]
