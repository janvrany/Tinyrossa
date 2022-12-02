"
Packed SIGN Doublewords
"
Class {
	#name : #AJx86PSIGND,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSSE3'
}

{ #category : #accessing }
AJx86PSIGND class >> description [
	^ #(#psignd #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r000F380A 0 )
]

{ #category : #accessing }
AJx86PSIGND class >> mnemonic [
	^ #psignd
]
