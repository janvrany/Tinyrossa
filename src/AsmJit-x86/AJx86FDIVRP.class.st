"
Floating-Point Reverse Divide and Pop Register Stack
"
Class {
	#name : #AJx86FDIVRP,
	#superclass : #AJx87StiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FDIVRP class >> description [
	^ #(#fdivrp #x87sti 0 0 "R" 0 "C1" 16r0000DEF0 0 )
]

{ #category : #accessing }
AJx86FDIVRP class >> mnemonic [
	^ #fdivrp
]

{ #category : #accessing }
AJx86FDIVRP >> opCode1 [
	^ 16rDEF0
]
