"
Packed SIGN Words
"
Class {
	#name : #AJx86PSIGNW,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSSE3'
}

{ #category : #accessing }
AJx86PSIGNW class >> description [
	^ #(#psignw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r000F3809 0 )
]

{ #category : #accessing }
AJx86PSIGNW class >> mnemonic [
	^ #psignw
]
