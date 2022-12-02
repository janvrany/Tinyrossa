"
Floating-Point No Operation
"
Class {
	#name : #AJx86FNOP,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FNOP class >> description [
	^ #(#fnop #emit 0 0 "R" 0 "C1" 16r0000D9D0 0 )
]

{ #category : #accessing }
AJx86FNOP class >> mnemonic [
	^ #fnop
]

{ #category : #accessing }
AJx86FNOP >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FNOP >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FNOP >> opCode [
	^ 16rD9D0
]
