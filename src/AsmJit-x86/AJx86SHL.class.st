"
Shift Logical Left
"
Class {
	#name : #AJx86SHL,
	#superclass : #AJx86RotInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86SHL class >> description [
	^ #(#shl #rot 0 0 "R" 4 0 0 )
]

{ #category : #accessing }
AJx86SHL class >> mnemonic [
	^ #shl
]

{ #category : #accessing }
AJx86SHL >> opCodeR [
	^ 16r4
]
