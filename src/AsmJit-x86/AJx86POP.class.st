"
Pop a Value from the Stack
"
Class {
	#name : #AJx86POP,
	#superclass : #AJx86PopInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86POP class >> description [
	^ #(#pop #pop 0 0 "R" 0 "C1" 16r00000058 "C2" 16r0000008F )
]

{ #category : #accessing }
AJx86POP class >> mnemonic [
	^ #pop
]

{ #category : #accessing }
AJx86POP >> opCode1 [
	^ 16r58
]

{ #category : #accessing }
AJx86POP >> opCode2 [
	^ 16r8F
]

{ #category : #accessing }
AJx86POP >> opCodeR [
	^ 16r0
]
