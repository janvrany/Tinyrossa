"
Floating-Point Add
"
Class {
	#name : #AJx86FADDP,
	#superclass : #AJx87StiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FADDP class >> description [
	^ #(#faddp #x87sti 0 0 "R" 0 "C1" 16r0000DEC0 0 )
]

{ #category : #accessing }
AJx86FADDP class >> mnemonic [
	^ #faddp
]

{ #category : #accessing }
AJx86FADDP >> opCode1 [
	^ 16rDEC0
]
