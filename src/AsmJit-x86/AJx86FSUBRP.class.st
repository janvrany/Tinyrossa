"
Floating-Point Reverse Subtract and Pop Register Stack
"
Class {
	#name : #AJx86FSUBRP,
	#superclass : #AJx87StiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FSUBRP class >> description [
	^ #(#fsubrp #x87sti 0 0 "R" 0 "C1" 16r0000DEE0 0 )
]

{ #category : #accessing }
AJx86FSUBRP class >> mnemonic [
	^ #fsubrp
]

{ #category : #accessing }
AJx86FSUBRP >> opCode1 [
	^ 16rDEE0
]
