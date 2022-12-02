"
Shift Arithmetic Left
"
Class {
	#name : #AJx86SAL,
	#superclass : #AJx86RotInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86SAL class >> description [
	^ #(#sal #rot 0 0 "R" 4 0 0 )
]

{ #category : #accessing }
AJx86SAL class >> mnemonic [
	^ #sal
]

{ #category : #accessing }
AJx86SAL >> opCodeR [
	^ 16r4
]
