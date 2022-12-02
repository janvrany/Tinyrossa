"
System Return
"
Class {
	#name : #AJx86SYSEXIT,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86SYSEXIT class >> mnemonic [
	^ #sysexit
]

{ #category : #accessing }
AJx86SYSEXIT >> opCode [
	^ 16r0F35
]
