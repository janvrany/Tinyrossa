"
Floating-Point Extract Exponent and Significand
"
Class {
	#name : #AJx86FXTRACT,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FXTRACT class >> description [
	^ #(#fxtract #emit 0 0 "R" 0 "C1" 16r0000D9F4 0 )
]

{ #category : #accessing }
AJx86FXTRACT class >> mnemonic [
	^ #fxtract
]

{ #category : #accessing }
AJx86FXTRACT >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FXTRACT >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FXTRACT >> opCode [
	^ 16rD9F4
]
