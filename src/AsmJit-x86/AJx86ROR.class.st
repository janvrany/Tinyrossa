"
Rotate Right
"
Class {
	#name : #AJx86ROR,
	#superclass : #AJx86RotInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86ROR class >> description [
	^ #(#ror #rot 0 0 "R" 1 0 0 )
]

{ #category : #accessing }
AJx86ROR class >> mnemonic [
	^ #ror
]

{ #category : #accessing }
AJx86ROR >> opCodeR [
	^ 16r1
]
