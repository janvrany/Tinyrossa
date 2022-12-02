"
Floating-Point Unordered Compare and Pop Register Stack Twice
"
Class {
	#name : #AJx86FUCOMPP,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FUCOMPP class >> description [
	^ #(#fucompp #emit 0 0 "R" 0 "C1" 16r0000DAE9 0 )
]

{ #category : #accessing }
AJx86FUCOMPP class >> mnemonic [
	^ #fucompp
]

{ #category : #accessing }
AJx86FUCOMPP >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FUCOMPP >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FUCOMPP >> opCode [
	^ 16rDAE9
]
