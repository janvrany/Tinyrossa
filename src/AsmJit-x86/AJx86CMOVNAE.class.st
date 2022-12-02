"
Conditional Move if not Above or Equal (CF=1)
"
Class {
	#name : #AJx86CMOVNAE,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMOVNAE class >> description [
	^ #(#cmovnae #rrm 0 0 "R" 0 "C1" 16r00000F42 0 )
]

{ #category : #accessing }
AJx86CMOVNAE class >> mnemonic [
	^ #cmovnae
]

{ #category : #accessing }
AJx86CMOVNAE >> opCode1 [
	^ 16rF42
]
