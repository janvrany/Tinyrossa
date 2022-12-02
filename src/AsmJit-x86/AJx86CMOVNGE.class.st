"
Conditional Move if not Greater or Equal (SF~~OF)
"
Class {
	#name : #AJx86CMOVNGE,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMOVNGE class >> description [
	^ #(#cmovnge #rrm 0 0 "R" 0 "C1" 16r00000F4C 0 )
]

{ #category : #accessing }
AJx86CMOVNGE class >> mnemonic [
	^ #cmovnge
]

{ #category : #accessing }
AJx86CMOVNGE >> opCode1 [
	^ 16rF4C
]
