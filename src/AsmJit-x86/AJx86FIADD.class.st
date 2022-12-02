"
Floating-Point Add
"
Class {
	#name : #AJx86FIADD,
	#superclass : #AJx87MemoryInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FIADD class >> description [
	^ #(#fiadd #x87mem "op1" 2r110 0 "R" 0 "C1" 16rDEDA0000 0 )
]

{ #category : #accessing }
AJx86FIADD class >> mnemonic [
	^ #fiadd
]

{ #category : #accessing }
AJx86FIADD >> o1Flags [
	^ 16r6
]

{ #category : #accessing }
AJx86FIADD >> opCode1 [
	^ 16rDEDA0000
]

{ #category : #accessing }
AJx86FIADD >> opCodeR [
	^ 16r0
]
