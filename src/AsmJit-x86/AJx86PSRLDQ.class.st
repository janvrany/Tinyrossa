"
Shift Packed Double Quadword Right Logical
"
Class {
	#name : #AJx86PSRLDQ,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86PSRLDQ class >> description [
	^ #(#psrldq #mmurmi "op1" 2r100000 "op2" 2r10000000 "R" 3 0 "C2" 16r66000F73 )
]

{ #category : #accessing }
AJx86PSRLDQ class >> mnemonic [
	^ #psrldq
]
