"
Floating-Point Cosine
"
Class {
	#name : #AJx86FCOS,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FCOS class >> description [
	^ #(#fcos #emit 0 0 "R" 0 "C1" 16r0000D9FF 0 )
]

{ #category : #accessing }
AJx86FCOS class >> mnemonic [
	^ #fcos
]

{ #category : #accessing }
AJx86FCOS >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FCOS >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FCOS >> opCode [
	^ 16rD9FF
]
