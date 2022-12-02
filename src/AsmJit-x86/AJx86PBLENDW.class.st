"
Variable Blend Packed Words
"
Class {
	#name : #AJx86PBLENDW,
	#superclass : #AJx86MmuRmiImmediate8BitInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86PBLENDW class >> description [
	^ #(#pblendw #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3A0E 0 )
]

{ #category : #accessing }
AJx86PBLENDW class >> mnemonic [
	^ #pblendw
]
