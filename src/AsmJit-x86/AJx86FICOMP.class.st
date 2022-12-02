"
Floating-Point Compare Integer and Pop Register Stack
"
Class {
	#name : #AJx86FICOMP,
	#superclass : #AJx87MemoryInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FICOMP class >> description [
	^ #(#ficomp #x87mem "op1" 2r110 0 "R" 3 "C1" 16rDEDA0000 0 )
]

{ #category : #accessing }
AJx86FICOMP class >> mnemonic [
	^ #ficomp
]

{ #category : #accessing }
AJx86FICOMP >> o1Flags [
	^ 16r6
]

{ #category : #accessing }
AJx86FICOMP >> opCode1 [
	^ 16rDEDA0000
]

{ #category : #accessing }
AJx86FICOMP >> opCodeR [
	^ 16r3
]
