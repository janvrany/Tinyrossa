"
Floating-Point Reverse Subtract
"
Class {
	#name : #AJx86FISUBR,
	#superclass : #AJx87MemoryInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FISUBR class >> description [
	^ #(#fisubr #x87mem "op1" 2r110 0 "R" 5 "C1" 16rDEDA0000 0 )
]

{ #category : #accessing }
AJx86FISUBR class >> mnemonic [
	^ #fisubr
]

{ #category : #accessing }
AJx86FISUBR >> o1Flags [
	^ 16r6
]

{ #category : #accessing }
AJx86FISUBR >> opCode1 [
	^ 16rDEDA0000
]

{ #category : #accessing }
AJx86FISUBR >> opCodeR [
	^ 16r5
]
