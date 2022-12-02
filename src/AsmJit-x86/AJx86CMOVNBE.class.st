"
Conditional Move if not Below or Equal (CF=0 and ZF=0)
"
Class {
	#name : #AJx86CMOVNBE,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMOVNBE class >> description [
	^ #(#cmovnbe #rrm 0 0 "R" 0 "C1" 16r00000F47 0 )
]

{ #category : #accessing }
AJx86CMOVNBE class >> mnemonic [
	^ #cmovnbe
]

{ #category : #accessing }
AJx86CMOVNBE >> opCode1 [
	^ 16rF47
]
