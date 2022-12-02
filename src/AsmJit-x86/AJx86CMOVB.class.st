"
Conditional Move if Below (CF = 1)
"
Class {
	#name : #AJx86CMOVB,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMOVB class >> description [
	^ #(#cmovb #rrm 0 0 "R" 0 "C1" 16r00000F42 0 )
]

{ #category : #accessing }
AJx86CMOVB class >> mnemonic [
	^ #cmovb
]

{ #category : #accessing }
AJx86CMOVB >> opCode1 [
	^ 16rF42
]
