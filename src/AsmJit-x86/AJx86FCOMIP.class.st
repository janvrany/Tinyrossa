"
Floating-Point Compare, Set EFLAGS and Pop Register Stack
"
Class {
	#name : #AJx86FCOMIP,
	#superclass : #AJx87StiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FCOMIP class >> description [
	^ #(#fcomip #x87sti 0 0 "R" 0 "C1" 16r0000DFF0 0 )
]

{ #category : #accessing }
AJx86FCOMIP class >> mnemonic [
	^ #fcomip
]

{ #category : #accessing }
AJx86FCOMIP >> opCode1 [
	^ 16rDFF0
]
