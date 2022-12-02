"
Floating-Point Move if not Equal (ZF=0)
"
Class {
	#name : #AJx86FCMOVNE,
	#superclass : #AJx87StiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FCMOVNE class >> description [
	^ #(#fcmovne #x87sti 0 0 "R" 0 "C1" 16r0000DBC8 0 )
]

{ #category : #accessing }
AJx86FCMOVNE class >> mnemonic [
	^ #fcmovne
]

{ #category : #accessing }
AJx86FCMOVNE >> opCode1 [
	^ 16rDBC8
]
