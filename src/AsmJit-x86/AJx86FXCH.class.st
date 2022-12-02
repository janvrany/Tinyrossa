"
Floating-Point Exchange Register Contents
"
Class {
	#name : #AJx86FXCH,
	#superclass : #AJx87StiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FXCH class >> description [
	^ #(#fxch #x87sti 0 0 "R" 0 "C1" 16r0000D9C8 0 )
]

{ #category : #accessing }
AJx86FXCH class >> mnemonic [
	^ #fxch
]

{ #category : #accessing }
AJx86FXCH >> opCode1 [
	^ 16rD9C8
]
