"
Floating-Point Move if Below (CF=1)
"
Class {
	#name : #AJx86FCMOVB,
	#superclass : #AJx87StiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FCMOVB class >> description [
	^ #(#fcmovb #x87sti 0 0 "R" 0 "C1" 16r0000DAC0 0 )
]

{ #category : #accessing }
AJx86FCMOVB class >> mnemonic [
	^ #fcmovb
]

{ #category : #accessing }
AJx86FCMOVB >> opCode1 [
	^ 16rDAC0
]
