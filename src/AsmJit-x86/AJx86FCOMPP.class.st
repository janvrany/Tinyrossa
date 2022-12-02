"
Floating-Point Compare and Pop Register Stack Twice
"
Class {
	#name : #AJx86FCOMPP,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FCOMPP class >> description [
	^ #(#fcompp #emit 0 0 "R" 0 "C1" 16r0000DED9 0 )
]

{ #category : #accessing }
AJx86FCOMPP class >> mnemonic [
	^ #fcompp
]

{ #category : #accessing }
AJx86FCOMPP >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FCOMPP >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FCOMPP >> opCode [
	^ 16rDED9
]
