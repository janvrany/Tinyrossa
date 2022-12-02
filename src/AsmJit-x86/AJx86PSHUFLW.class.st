"
Packed Shuffle Low Words
"
Class {
	#name : #AJx86PSHUFLW,
	#superclass : #AJx86MmuRmiImmediate8BitInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86PSHUFLW class >> description [
	^ #(#pshuflw #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF2000F70 0 )
]

{ #category : #accessing }
AJx86PSHUFLW class >> mnemonic [
	^ #pshuflw
]
