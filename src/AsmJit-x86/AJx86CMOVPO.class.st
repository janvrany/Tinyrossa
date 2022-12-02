"
Conditional Move if Parity Odd (PF=0)
"
Class {
	#name : #AJx86CMOVPO,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMOVPO class >> description [
	^ #(#cmovpo #rrm 0 0 "R" 0 "C1" 16r00000F4B 0 )
]

{ #category : #accessing }
AJx86CMOVPO class >> mnemonic [
	^ #cmovpo
]

{ #category : #accessing }
AJx86CMOVPO >> opCode1 [
	^ 16rF4B
]
