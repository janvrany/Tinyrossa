"
Floating-Point Unordered Compare
"
Class {
	#name : #AJx86FUCOM,
	#superclass : #AJx87StiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FUCOM class >> description [
	^ #(#fucom #x87sti 0 0 "R" 0 "C1" 16r0000DDE0 0 )
]

{ #category : #accessing }
AJx86FUCOM class >> mnemonic [
	^ #fucom
]

{ #category : #accessing }
AJx86FUCOM >> opCode1 [
	^ 16rDDE0
]
