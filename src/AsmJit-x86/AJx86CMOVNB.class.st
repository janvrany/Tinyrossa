"
Conditional Move if not Below (CF=0)
"
Class {
	#name : #AJx86CMOVNB,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMOVNB class >> description [
	^ #(#cmovnb #rrm 0 0 "R" 0 "C1" 16r00000F43 0 )
]

{ #category : #accessing }
AJx86CMOVNB class >> mnemonic [
	^ #cmovnb
]

{ #category : #accessing }
AJx86CMOVNB >> opCode1 [
	^ 16rF43
]
