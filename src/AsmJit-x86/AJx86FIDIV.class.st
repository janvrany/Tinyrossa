"
Floating-Point Divide
"
Class {
	#name : #AJx86FIDIV,
	#superclass : #AJx87MemoryInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FIDIV class >> description [
	^ #(#fidiv #x87mem "op1" 2r110 0 "R" 6 "C1" 16rDEDA0000 0 )
]

{ #category : #accessing }
AJx86FIDIV class >> mnemonic [
	^ #fidiv
]

{ #category : #accessing }
AJx86FIDIV >> o1Flags [
	^ 16r6
]

{ #category : #accessing }
AJx86FIDIV >> opCode1 [
	^ 16rDEDA0000
]

{ #category : #accessing }
AJx86FIDIV >> opCodeR [
	^ 16r6
]
