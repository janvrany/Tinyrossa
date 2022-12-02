"
Store AH into Flags
"
Class {
	#name : #AJx86SAHF,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86SAHF class >> description [
	^ #(#sahf #emit 0 0 "R" 0 "C1" 16r0000009E 0 )
]

{ #category : #accessing }
AJx86SAHF class >> mnemonic [
	^ #sahf
]

{ #category : #accessing }
AJx86SAHF >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86SAHF >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86SAHF >> opCode [
	^ 16r9E
]
