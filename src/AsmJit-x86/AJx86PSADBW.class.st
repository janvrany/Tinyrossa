"
Compupte Sum of Absolute Differences of Packed Unsigned Byte Integers
"
Class {
	#name : #AJx86PSADBW,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86PSADBW class >> description [
	^ #(#psadbw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FF6 0 )
]

{ #category : #accessing }
AJx86PSADBW class >> mnemonic [
	^ #psadbw
]
