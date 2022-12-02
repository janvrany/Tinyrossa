"
Packed Align Right
"
Class {
	#name : #AJx86PALIGNR,
	#superclass : #AJx86MmuRmiImmediate8BitInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSSE3'
}

{ #category : #accessing }
AJx86PALIGNR class >> description [
	^ #(#palignr #mmuRmImm8 "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r000F3A0F 0 )
]

{ #category : #accessing }
AJx86PALIGNR class >> mnemonic [
	^ #palignr
]
