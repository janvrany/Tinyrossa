"
Floating-Point Store Integer with Truncation
"
Class {
	#name : #AJx86FISTTP,
	#superclass : #AJx87MemoryInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FISTTP class >> description [
	^ #(#fisttp #x87mem "op1" 2r1110 0 "R" 1 "C1" 16rDFDBDD01 0 )
]

{ #category : #accessing }
AJx86FISTTP class >> mnemonic [
	^ #fisttp
]

{ #category : #accessing }
AJx86FISTTP >> o1Flags [
	^ 16rE
]

{ #category : #accessing }
AJx86FISTTP >> opCode1 [
	^ 16rDFDBDD01
]

{ #category : #accessing }
AJx86FISTTP >> opCodeR [
	^ 16r1
]
