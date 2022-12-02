"
Move Doubleword
"
Class {
	#name : #AJx86MOVD,
	#superclass : #AJx86MmuMovInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86MOVD class >> description [
	^ #(#movd #mmuMovD 0 0 "R" 0 0 0 )
]

{ #category : #accessing }
AJx86MOVD class >> group [
	^ #mmuMovD
]

{ #category : #accessing }
AJx86MOVD class >> mnemonic [
	^ #movd
]
