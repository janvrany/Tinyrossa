"
Floating-Point Sine and Cosine
"
Class {
	#name : #AJx86FSINCOS,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FSINCOS class >> description [
	^ #(#fsincos #emit 0 0 "R" 0 "C1" 16r0000D9FB 0 )
]

{ #category : #accessing }
AJx86FSINCOS class >> mnemonic [
	^ #fsincos
]

{ #category : #accessing }
AJx86FSINCOS >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FSINCOS >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FSINCOS >> opCode [
	^ 16rD9FB
]
