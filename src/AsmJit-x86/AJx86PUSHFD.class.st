"
Push EFLAGS Register onto the Stack
"
Class {
	#name : #AJx86PUSHFD,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86PUSHFD class >> description [
	^ #(#pushfd #emit "op1" 2r1000000000 0 "R" 0 "C1" 16r0000009C 0 )
]

{ #category : #accessing }
AJx86PUSHFD class >> mnemonic [
	^ #pushfd
]

{ #category : #accessing }
AJx86PUSHFD >> is32BitOnly [
	^ true
]

{ #category : #accessing }
AJx86PUSHFD >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86PUSHFD >> opCode [
	^ 16r9C
]
