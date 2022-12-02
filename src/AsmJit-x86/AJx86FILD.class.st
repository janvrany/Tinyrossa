"
Floating-Point Load Integer
"
Class {
	#name : #AJx86FILD,
	#superclass : #AJx87MemoryInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FILD class >> description [
	^ #(#fild #x87mem "op1" 2r1110 0 "R" 0 "C1" 16rDFDBDF05 0 )
]

{ #category : #accessing }
AJx86FILD class >> mnemonic [
	^ #fild
]

{ #category : #accessing }
AJx86FILD >> o1Flags [
	^ 16rE
]

{ #category : #accessing }
AJx86FILD >> opCode1 [
	^ 16rDFDBDF05
]

{ #category : #accessing }
AJx86FILD >> opCodeR [
	^ 16r0
]
