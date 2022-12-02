"
Assert LOCK# Signal Prefix
"
Class {
	#name : #AJx86LOCK,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86LOCK class >> description [
	^ #(#lock #emit 0 0 "R" 0 "C1" 16r000000F0 0 )
]

{ #category : #accessing }
AJx86LOCK class >> mnemonic [
	^ #lock
]

{ #category : #accessing }
AJx86LOCK >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86LOCK >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86LOCK >> opCode [
	^ 16rF0
]
