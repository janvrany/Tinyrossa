"
Move Quadword
"
Class {
	#name : #AJx86MOVQ,
	#superclass : #AJx86MmuMovInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86MOVQ class >> description [
	^ #(#movq #mmuMovQ 0 0 "R" 0 0 0 )
]

{ #category : #accessing }
AJx86MOVQ class >> group [
	^ #mmuMovQ
]

{ #category : #accessing }
AJx86MOVQ class >> mnemonic [
	^ #movq
]
