"
Pop Top of Stack into EFLAGS Register
"
Class {
	#name : #AJx86POPFD,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86POPFD class >> description [
	^ #(#popfd #emit 0 0 "R" 0 "C1" 16r0000009D 0 )
]

{ #category : #accessing }
AJx86POPFD class >> mnemonic [
	^ #popfd
]

{ #category : #accessing }
AJx86POPFD >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86POPFD >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86POPFD >> opCode [
	^ 16r9D
]
