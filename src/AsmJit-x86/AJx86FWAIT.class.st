"
Wait for Pending Floating-Point Exceptions
"
Class {
	#name : #AJx86FWAIT,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FWAIT class >> description [
	^ #(#fwait #emit 0 0 "R" 0 "C1" 16r0000009B 0 )
]

{ #category : #accessing }
AJx86FWAIT class >> mnemonic [
	^ #fwait
]

{ #category : #accessing }
AJx86FWAIT >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FWAIT >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FWAIT >> opCode [
	^ 16r9B
]
