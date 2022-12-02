"
Extract Quadword
"
Class {
	#name : #AJx86PEXTRQ,
	#superclass : #AJx86MmuPextrInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4a'
}

{ #category : #accessing }
AJx86PEXTRQ class >> description [
	^ #(#pextrq #mmuPextr "op1" 2r1001100 "op2" 2r100000 "R" 1 "C1" 16r000F3A16 0 )
]

{ #category : #accessing }
AJx86PEXTRQ class >> mnemonic [
	^ #pextrq
]
