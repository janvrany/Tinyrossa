"
Floating-Point Scale
"
Class {
	#name : #AJx86FSCALE,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FSCALE class >> description [
	^ #(#fscale #emit 0 0 "R" 0 "C1" 16r0000D9FD 0 )
]

{ #category : #accessing }
AJx86FSCALE class >> mnemonic [
	^ #fscale
]

{ #category : #accessing }
AJx86FSCALE >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FSCALE >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FSCALE >> opCode [
	^ 16rD9FD
]
