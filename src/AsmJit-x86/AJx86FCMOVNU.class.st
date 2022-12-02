"
Floating-Point Move if not Unordered (PF=0)
"
Class {
	#name : #AJx86FCMOVNU,
	#superclass : #AJx87StiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FCMOVNU class >> description [
	^ #(#fcmovnu #x87sti 0 0 "R" 0 "C1" 16r0000DBD8 0 )
]

{ #category : #accessing }
AJx86FCMOVNU class >> mnemonic [
	^ #fcmovnu
]

{ #category : #accessing }
AJx86FCMOVNU >> opCode1 [
	^ 16rDBD8
]
