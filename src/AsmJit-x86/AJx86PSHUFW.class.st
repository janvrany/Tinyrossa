"
Shuffle Packed Words
"
Class {
	#name : #AJx86PSHUFW,
	#superclass : #AJx86MmuRmiImmediate8BitInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86PSHUFW class >> description [
	^ #(#pshufw #mmuRmImm8 "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000F70 0 )
]

{ #category : #accessing }
AJx86PSHUFW class >> mnemonic [
	^ #pshufw
]
