"
Extract Word
"
Class {
	#name : #AJx86PEXTRW,
	#superclass : #AJx86MmuPextrInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86PEXTRW class >> description [
	^ #(#pextrw #mmuPextr "op1" 2r1000100 "op2" 2r110000 "R" 0 "C1" 16r000F3A16 0 )
]

{ #category : #accessing }
AJx86PEXTRW class >> mnemonic [
	^ #pextrw
]
