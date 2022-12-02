"
Floating-Point Divide and Pop Register Stack
"
Class {
	#name : #AJx86FDIVP,
	#superclass : #AJx87StiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FDIVP class >> description [
	^ #(#fdivp #x87sti 0 0 "R" 0 "C1" 16r0000DEF8 0 )
]

{ #category : #accessing }
AJx86FDIVP class >> mnemonic [
	^ #fdivp
]

{ #category : #accessing }
AJx86FDIVP >> opCode1 [
	^ 16rDEF8
]
