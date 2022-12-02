"
Packed Absolute Values 32bit
"
Class {
	#name : #AJx86PABSD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSSE3'
}

{ #category : #accessing }
AJx86PABSD class >> description [
	^ #(#pabsd #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r000F381E 0 )
]

{ #category : #accessing }
AJx86PABSD class >> mnemonic [
	^ #pabsd
]
