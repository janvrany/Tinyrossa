"
Return the Count of Number of Bits Set to 1
"
Class {
	#name : #AJx86POPCNT,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.2'
}

{ #category : #accessing }
AJx86POPCNT class >> description [
	^ #(#popcnt #rrm 0 0 "R" 0 "C1" 16rF3000FB8 0 )
]

{ #category : #accessing }
AJx86POPCNT class >> mnemonic [
	^ #popcnt
]

{ #category : #accessing }
AJx86POPCNT >> opCode1 [
	^ 16rF3000FB8
]
