"
Floating-Point Subtract amd Pop Register Stack
"
Class {
	#name : #AJx86FSUBP,
	#superclass : #AJx87StiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FSUBP class >> description [
	^ #(#fsubp #x87sti 0 0 "R" 0 "C1" 16r0000DEE8 0 )
]

{ #category : #accessing }
AJx86FSUBP class >> mnemonic [
	^ #fsubp
]

{ #category : #accessing }
AJx86FSUBP >> opCode1 [
	^ 16rDEE8
]
