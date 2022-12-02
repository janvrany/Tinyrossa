"
Conditional Move if Greater or Equal (SF=OF)
"
Class {
	#name : #AJx86CMOVGE,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMOVGE class >> description [
	^ #(#cmovge #rrm 0 0 "R" 0 "C1" 16r00000F4D 0 )
]

{ #category : #accessing }
AJx86CMOVGE class >> mnemonic [
	^ #cmovge
]

{ #category : #accessing }
AJx86CMOVGE >> opCode1 [
	^ 16rF4D
]
