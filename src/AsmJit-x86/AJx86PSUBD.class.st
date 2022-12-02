"
Subtract Packed Doubleword Integers
"
Class {
	#name : #AJx86PSUBD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PSUBD class >> description [
	^ #(#psubd #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FFA 0 )
]

{ #category : #accessing }
AJx86PSUBD class >> mnemonic [
	^ #psubd
]
