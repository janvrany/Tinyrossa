"
Floating-Point Move if not Below or Equal (CF=0 and ZF=0)
"
Class {
	#name : #AJx86FCMOVNBE,
	#superclass : #AJx87StiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FCMOVNBE class >> description [
	^ #(#fcmovnbe #x87sti 0 0 "R" 0 "C1" 16r0000DBD0 0 )
]

{ #category : #accessing }
AJx86FCMOVNBE class >> mnemonic [
	^ #fcmovnbe
]

{ #category : #accessing }
AJx86FCMOVNBE >> opCode1 [
	^ 16rDBD0
]
