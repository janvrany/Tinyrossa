"
Floating-Point Store Integer
"
Class {
	#name : #AJx86FIST,
	#superclass : #AJx87MemoryInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FIST class >> description [
	^ #(#fist #x87mem "op1" 2r110 0 "R" 2 "C1" 16rDFDB0000 0 )
]

{ #category : #accessing }
AJx86FIST class >> mnemonic [
	^ #fist
]

{ #category : #accessing }
AJx86FIST >> o1Flags [
	^ 16r6
]

{ #category : #accessing }
AJx86FIST >> opCode1 [
	^ 16rDFDB0000
]

{ #category : #accessing }
AJx86FIST >> opCodeR [
	^ 16r2
]
