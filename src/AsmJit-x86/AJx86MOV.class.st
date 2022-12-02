"
Move
"
Class {
	#name : #AJx86MOV,
	#superclass : #AJx86MovInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86MOV class >> description [
	^ #(#mov #mov 0 0 "R" 0 0 0 )
]

{ #category : #accessing }
AJx86MOV class >> mnemonic [
	^ #mov
]

{ #category : #accessing }
AJx86MOV >> binarySize [
	self flag: 'TODO: delegate to label!'.
	^source isLabel ifTrue: [ ^5 ].
]
