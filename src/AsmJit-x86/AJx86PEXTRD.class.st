"
Extract Doubleword
"
Class {
	#name : #AJx86PEXTRD,
	#superclass : #AJx86MmuPextrInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86PEXTRD class >> description [
	^ #(#pextrd #mmuPextr "op1" 2r1000100 "op2" 2r100000 "R" 0 "C1" 16r000F3A16 0 )
]

{ #category : #accessing }
AJx86PEXTRD class >> mnemonic [
	^ #pextrd
]
