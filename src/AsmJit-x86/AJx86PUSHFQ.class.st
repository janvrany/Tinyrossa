"
Push RFLAGS Register onto the Stack
"
Class {
	#name : #AJx86PUSHFQ,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86PUSHFQ class >> description [
	^ #(#pushfq #emit "op1" 2r100000000 0 "R" 0 "C1" 16r0000009C 0 )
]

{ #category : #accessing }
AJx86PUSHFQ class >> mnemonic [
	^ #pushfq
]

{ #category : #accessing }
AJx86PUSHFQ >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86PUSHFQ >> is64BitOnly [
	^ true
]

{ #category : #accessing }
AJx86PUSHFQ >> opCode [
	^ 16r9C
]
