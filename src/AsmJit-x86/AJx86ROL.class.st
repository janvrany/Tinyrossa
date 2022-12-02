"
Rotate Left
"
Class {
	#name : #AJx86ROL,
	#superclass : #AJx86RotInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86ROL class >> description [
	^ #(#rol #rot 0 0 "R" 0 0 0 )
]

{ #category : #accessing }
AJx86ROL class >> mnemonic [
	^ #rol
]

{ #category : #accessing }
AJx86ROL >> opCodeR [
	^ 16r0
]
