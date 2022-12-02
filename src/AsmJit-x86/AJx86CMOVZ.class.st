"
Conditional Move if Zero (ZF=1)
"
Class {
	#name : #AJx86CMOVZ,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMOVZ class >> description [
	^ #(#cmovz #rrm 0 0 "R" 0 "C1" 16r00000F44 0 )
]

{ #category : #accessing }
AJx86CMOVZ class >> mnemonic [
	^ #cmovz
]

{ #category : #accessing }
AJx86CMOVZ >> opCode1 [
	^ 16rF44
]
