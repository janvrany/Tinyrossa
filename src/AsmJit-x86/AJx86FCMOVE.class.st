"
Floating-Point Move if Equal (ZF=1)
"
Class {
	#name : #AJx86FCMOVE,
	#superclass : #AJx87StiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FCMOVE class >> description [
	^ #(#fcmove #x87sti 0 0 "R" 0 "C1" 16r0000DAC8 0 )
]

{ #category : #accessing }
AJx86FCMOVE class >> mnemonic [
	^ #fcmove
]

{ #category : #accessing }
AJx86FCMOVE >> opCode1 [
	^ 16rDAC8
]
