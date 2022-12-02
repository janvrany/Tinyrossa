"
Conditional Move if not Signed (SF=0)
"
Class {
	#name : #AJx86CMOVNS,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMOVNS class >> description [
	^ #(#cmovns #rrm 0 0 "R" 0 "C1" 16r00000F49 0 )
]

{ #category : #accessing }
AJx86CMOVNS class >> mnemonic [
	^ #cmovns
]

{ #category : #accessing }
AJx86CMOVNS >> opCode1 [
	^ 16rF49
]
