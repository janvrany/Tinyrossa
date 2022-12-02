"
Conditional Move if Below or Equal (CF = 1 or ZF = 1)
"
Class {
	#name : #AJx86CMOVBE,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMOVBE class >> description [
	^ #(#cmovbe #rrm 0 0 "R" 0 "C1" 16r00000F46 0 )
]

{ #category : #accessing }
AJx86CMOVBE class >> mnemonic [
	^ #cmovbe
]

{ #category : #accessing }
AJx86CMOVBE >> opCode1 [
	^ 16rF46
]
