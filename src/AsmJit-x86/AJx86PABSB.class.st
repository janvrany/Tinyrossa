"
Packed Absolute Values 8bit
"
Class {
	#name : #AJx86PABSB,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSSE3'
}

{ #category : #accessing }
AJx86PABSB class >> description [
	^ #(#pabsb #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r000F381C 0 )
]

{ #category : #accessing }
AJx86PABSB class >> mnemonic [
	^ #pabsb
]
