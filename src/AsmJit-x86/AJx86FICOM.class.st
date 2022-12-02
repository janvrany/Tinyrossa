"
Floating-Point Compare Integer
"
Class {
	#name : #AJx86FICOM,
	#superclass : #AJx87MemoryInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FICOM class >> description [
	^ #(#ficom #x87mem "op1" 2r110 0 "R" 2 "C1" 16rDEDA0000 0 )
]

{ #category : #accessing }
AJx86FICOM class >> mnemonic [
	^ #ficom
]

{ #category : #accessing }
AJx86FICOM >> o1Flags [
	^ 16r6
]

{ #category : #accessing }
AJx86FICOM >> opCode1 [
	^ 16rDEDA0000
]

{ #category : #accessing }
AJx86FICOM >> opCodeR [
	^ 16r2
]
