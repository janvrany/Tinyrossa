"
Conditional Move if Above or Equal (CF = 0)
"
Class {
	#name : #AJx86CMOVAE,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMOVAE class >> description [
	^ #(#cmovae #rrm 0 0 "R" 0 "C1" 16r00000F43 0 )
]

{ #category : #accessing }
AJx86CMOVAE class >> mnemonic [
	^ #cmovae
]

{ #category : #accessing }
AJx86CMOVAE >> opCode1 [
	^ 16rF43
]
