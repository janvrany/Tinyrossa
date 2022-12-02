"
Minimum of Packed Unsigned Byte Integers
"
Class {
	#name : #AJx86PMINUB,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86PMINUB class >> description [
	^ #(#pminub #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FDA 0 )
]

{ #category : #accessing }
AJx86PMINUB class >> mnemonic [
	^ #pminub
]
