"
Initialize Floating-Point Unit
"
Class {
	#name : #AJx86FNINIT,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FNINIT class >> description [
	^ #(#fninit #emit 0 0 "R" 0 "C1" 16r0000DBE3 0 )
]

{ #category : #accessing }
AJx86FNINIT class >> mnemonic [
	^ #fninit
]

{ #category : #accessing }
AJx86FNINIT >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FNINIT >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FNINIT >> opCode [
	^ 16rDBE3
]
