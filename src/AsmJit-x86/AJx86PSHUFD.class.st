"
Packed Shuffle Doublewords
"
Class {
	#name : #AJx86PSHUFD,
	#superclass : #AJx86MmuRmiImmediate8BitInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86PSHUFD class >> description [
	^ #(#pshufd #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F70 0 )
]

{ #category : #accessing }
AJx86PSHUFD class >> mnemonic [
	^ #pshufd
]
