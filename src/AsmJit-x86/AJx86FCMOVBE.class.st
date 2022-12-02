"
Floating-Point Move if Below or Equal (CF=1 or ZF=1)
"
Class {
	#name : #AJx86FCMOVBE,
	#superclass : #AJx87StiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FCMOVBE class >> description [
	^ #(#fcmovbe #x87sti 0 0 "R" 0 "C1" 16r0000DAD0 0 )
]

{ #category : #accessing }
AJx86FCMOVBE class >> mnemonic [
	^ #fcmovbe
]

{ #category : #accessing }
AJx86FCMOVBE >> opCode1 [
	^ 16rDAD0
]
