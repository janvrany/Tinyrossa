"
Floating-Point Unordered Compare and Pop Register Stack
"
Class {
	#name : #AJx86FUCOMP,
	#superclass : #AJx87StiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FUCOMP class >> description [
	^ #(#fucomp #x87sti 0 0 "R" 0 "C1" 16r0000DDE8 0 )
]

{ #category : #accessing }
AJx86FUCOMP class >> mnemonic [
	^ #fucomp
]

{ #category : #accessing }
AJx86FUCOMP >> opCode1 [
	^ 16rDDE8
]
