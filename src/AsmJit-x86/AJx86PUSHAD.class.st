"
Push All General-Purpose Registers onto the Stack
"
Class {
	#name : #AJx86PUSHAD,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86PUSHAD class >> description [
	^ #(#pushad #emit "op1" 2r1000000000 0 "R" 0 "C1" 16r00000060 0 )
]

{ #category : #accessing }
AJx86PUSHAD class >> mnemonic [
	^ #pushad
]

{ #category : #accessing }
AJx86PUSHAD >> is32BitOnly [
	^ true
]

{ #category : #accessing }
AJx86PUSHAD >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86PUSHAD >> opCode [
	^ 16r60
]
