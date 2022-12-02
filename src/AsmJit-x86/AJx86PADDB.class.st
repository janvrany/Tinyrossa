"
Add Packed Byte Integers
"
Class {
	#name : #AJx86PADDB,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86PADDB class >> description [
	^ #(#paddb #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FFC 0 )
]

{ #category : #accessing }
AJx86PADDB class >> mnemonic [
	^ #paddb
]
