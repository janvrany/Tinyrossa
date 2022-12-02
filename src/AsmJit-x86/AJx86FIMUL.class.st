"
Floating-Point Multiply
"
Class {
	#name : #AJx86FIMUL,
	#superclass : #AJx87MemoryInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FIMUL class >> description [
	^ #(#fimul #x87mem "op1" 2r110 0 "R" 1 "C1" 16rDEDA0000 0 )
]

{ #category : #accessing }
AJx86FIMUL class >> mnemonic [
	^ #fimul
]

{ #category : #accessing }
AJx86FIMUL >> o1Flags [
	^ 16r6
]

{ #category : #accessing }
AJx86FIMUL >> opCode1 [
	^ 16rDEDA0000
]

{ #category : #accessing }
AJx86FIMUL >> opCodeR [
	^ 16r1
]
