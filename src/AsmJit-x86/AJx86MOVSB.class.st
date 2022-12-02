"
Move Data from String to String
"
Class {
	#name : #AJx86MOVSB,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86MOVSB class >> description [
	^ #(#movsb #emit 0 0 "R" 0 "C1" 16r000000A4 0 )
]

{ #category : #accessing }
AJx86MOVSB class >> mnemonic [
	^ #movsb
]

{ #category : #accessing }
AJx86MOVSB >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86MOVSB >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86MOVSB >> opCode [
	^ 16rA4
]
