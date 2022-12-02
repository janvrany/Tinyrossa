"
Conditional Move if Equal (ZF=1)
"
Class {
	#name : #AJx86CMOVE,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMOVE class >> description [
	^ #(#cmove #rrm 0 0 "R" 0 "C1" 16r00000F44 0 )
]

{ #category : #accessing }
AJx86CMOVE class >> mnemonic [
	^ #cmove
]

{ #category : #accessing }
AJx86CMOVE >> opCode1 [
	^ 16rF44
]
