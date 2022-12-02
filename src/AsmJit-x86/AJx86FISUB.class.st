"
Floating-Point Subtract
"
Class {
	#name : #AJx86FISUB,
	#superclass : #AJx87MemoryInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FISUB class >> description [
	^ #(#fisub #x87mem "op1" 2r110 0 "R" 4 "C1" 16rDEDA0000 0 )
]

{ #category : #accessing }
AJx86FISUB class >> mnemonic [
	^ #fisub
]

{ #category : #accessing }
AJx86FISUB >> o1Flags [
	^ 16r6
]

{ #category : #accessing }
AJx86FISUB >> opCode1 [
	^ 16rDEDA0000
]

{ #category : #accessing }
AJx86FISUB >> opCodeR [
	^ 16r4
]
