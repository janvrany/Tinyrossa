"
Floating-Point Clear Exceptions
"
Class {
	#name : #AJx86FCLEX,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FCLEX class >> description [
	^ #(#fclex #emit 0 0 "R" 0 "C1" 16r9B00DBE2 0 )
]

{ #category : #accessing }
AJx86FCLEX class >> mnemonic [
	^ #fclex
]

{ #category : #accessing }
AJx86FCLEX >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FCLEX >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FCLEX >> opCode [
	^ 16r9B00DBE2
]
