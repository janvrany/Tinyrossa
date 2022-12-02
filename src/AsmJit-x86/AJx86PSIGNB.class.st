"
Packed SIGN Bytes
"
Class {
	#name : #AJx86PSIGNB,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSSE3'
}

{ #category : #accessing }
AJx86PSIGNB class >> description [
	^ #(#psignb #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r000F3808 0 )
]

{ #category : #accessing }
AJx86PSIGNB class >> mnemonic [
	^ #psignb
]
