"
Initialize Floating-Point Unit
"
Class {
	#name : #AJx86FINIT,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FINIT class >> description [
	^ #(#finit #emit 0 0 "R" 0 "C1" 16r9B00DBE3 0 )
]

{ #category : #accessing }
AJx86FINIT class >> mnemonic [
	^ #finit
]

{ #category : #accessing }
AJx86FINIT >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FINIT >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FINIT >> opCode [
	^ 16r9B00DBE3
]
