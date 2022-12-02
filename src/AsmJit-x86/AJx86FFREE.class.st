"
Free Floating-Point Register
"
Class {
	#name : #AJx86FFREE,
	#superclass : #AJx87StiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FFREE class >> description [
	^ #(#ffree #x87sti 0 0 "R" 0 "C1" 16r0000DDC0 0 )
]

{ #category : #accessing }
AJx86FFREE class >> mnemonic [
	^ #ffree
]

{ #category : #accessing }
AJx86FFREE >> opCode1 [
	^ 16rDDC0
]
