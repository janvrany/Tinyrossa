"
Pop All General-Purpose Registres
"
Class {
	#name : #AJx86POPAD,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86POPAD class >> description [
	^ #(#popad #emit "op1" 2r1000000000 0 "R" 0 "C1" 16r00000061 0 )
]

{ #category : #accessing }
AJx86POPAD class >> mnemonic [
	^ #popad
]

{ #category : #accessing }
AJx86POPAD >> is32BitOnly [
	^ true
]

{ #category : #accessing }
AJx86POPAD >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86POPAD >> opCode [
	^ 16r61
]
