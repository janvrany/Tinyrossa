"
System Call
"
Class {
	#name : #AJx86SYSENTER,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86SYSENTER class >> mnemonic [
	^ #sysenter
]

{ #category : #accessing }
AJx86SYSENTER >> opCode [
	^ 16r0F34
]
