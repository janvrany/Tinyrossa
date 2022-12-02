"
Conditional Move if Parity (PF=1)
"
Class {
	#name : #AJx86CMOVP,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMOVP class >> description [
	^ #(#cmovp #rrm 0 0 "R" 0 "C1" 16r00000F4A 0 )
]

{ #category : #accessing }
AJx86CMOVP class >> mnemonic [
	^ #cmovp
]

{ #category : #accessing }
AJx86CMOVP >> opCode1 [
	^ 16rF4A
]
