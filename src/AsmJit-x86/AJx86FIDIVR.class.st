"
Floating-Point Reverse Divide
"
Class {
	#name : #AJx86FIDIVR,
	#superclass : #AJx87MemoryInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FIDIVR class >> description [
	^ #(#fidivr #x87mem "op1" 2r110 0 "R" 7 "C1" 16rDEDA0000 0 )
]

{ #category : #accessing }
AJx86FIDIVR class >> mnemonic [
	^ #fidivr
]

{ #category : #accessing }
AJx86FIDIVR >> o1Flags [
	^ 16r6
]

{ #category : #accessing }
AJx86FIDIVR >> opCode1 [
	^ 16rDEDA0000
]

{ #category : #accessing }
AJx86FIDIVR >> opCodeR [
	^ 16r7
]
