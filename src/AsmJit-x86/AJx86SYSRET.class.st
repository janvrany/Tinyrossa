"
Fast System Return
"
Class {
	#name : #AJx86SYSRET,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86SYSRET class >> mnemonic [
	^ #sysret
]

{ #category : #testing }
AJx86SYSRET >> is32BitOnly [
	^ false
]

{ #category : #testing }
AJx86SYSRET >> is64BitOnly [
	^ true
]

{ #category : #accessing }
AJx86SYSRET >> opCode [
	^ 16r0F07
]
