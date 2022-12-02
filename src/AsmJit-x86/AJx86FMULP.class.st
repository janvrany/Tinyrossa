"
Floating-Point Multiply and Pop the Register Stack
"
Class {
	#name : #AJx86FMULP,
	#superclass : #AJx87StiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FMULP class >> description [
	^ #(#fmulp #x87sti 0 0 "R" 0 "C1" 16r0000DEC8 0 )
]

{ #category : #accessing }
AJx86FMULP class >> mnemonic [
	^ #fmulp
]

{ #category : #accessing }
AJx86FMULP >> opCode1 [
	^ 16rDEC8
]
