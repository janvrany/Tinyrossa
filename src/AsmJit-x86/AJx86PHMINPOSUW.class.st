"
Packed Horizontal Word Minimum
"
Class {
	#name : #AJx86PHMINPOSUW,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86PHMINPOSUW class >> description [
	^ #(#phminposuw #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3841 0 )
]

{ #category : #accessing }
AJx86PHMINPOSUW class >> mnemonic [
	^ #phminposuw
]
