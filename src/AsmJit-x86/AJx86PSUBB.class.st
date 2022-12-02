"
Subtract Packed Byte Integers
"
Class {
	#name : #AJx86PSUBB,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PSUBB class >> description [
	^ #(#psubb #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FF8 0 )
]

{ #category : #accessing }
AJx86PSUBB class >> mnemonic [
	^ #psubb
]
