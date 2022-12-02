"
Floating-Point Move if not Below (CF=0)
"
Class {
	#name : #AJx86FCMOVNB,
	#superclass : #AJx87StiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FCMOVNB class >> description [
	^ #(#fcmovnb #x87sti 0 0 "R" 0 "C1" 16r0000DBC0 0 )
]

{ #category : #accessing }
AJx86FCMOVNB class >> mnemonic [
	^ #fcmovnb
]

{ #category : #accessing }
AJx86FCMOVNB >> opCode1 [
	^ 16rDBC0
]
