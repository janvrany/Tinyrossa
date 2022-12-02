"
Packed Compare Explicit Length Strings, Return Mask
"
Class {
	#name : #AJx86PCMPESTRM,
	#superclass : #AJx86MmuRmiImmediate8BitInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.2'
}

{ #category : #accessing }
AJx86PCMPESTRM class >> description [
	^ #(#pcmpestrm #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3A60 0 )
]

{ #category : #accessing }
AJx86PCMPESTRM class >> mnemonic [
	^ #pcmpestrm
]
