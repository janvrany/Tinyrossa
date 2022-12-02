"
Floating-Point Examine ModR/M
"
Class {
	#name : #AJx86FXAM,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FXAM class >> description [
	^ #(#fxam #emit 0 0 "R" 0 "C1" 16r0000D9E5 0 )
]

{ #category : #accessing }
AJx86FXAM class >> mnemonic [
	^ #fxam
]

{ #category : #accessing }
AJx86FXAM >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FXAM >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FXAM >> opCode [
	^ 16rD9E5
]
