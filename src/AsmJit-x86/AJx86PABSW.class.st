"
Packed Absolute Values 16bit
"
Class {
	#name : #AJx86PABSW,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSSE3'
}

{ #category : #accessing }
AJx86PABSW class >> description [
	^ #(#pabsw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r000F381D 0 )
]

{ #category : #accessing }
AJx86PABSW class >> mnemonic [
	^ #pabsw
]
