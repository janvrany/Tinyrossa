"
Two's Complement Negation
"
Class {
	#name : #AJx86NEG,
	#superclass : #AJx86RmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86NEG class >> description [
	^ #(#neg #rm 0 0 "R" 3 "C1" 16r000000F6 0 )
]

{ #category : #accessing }
AJx86NEG class >> mnemonic [
	^ #neg
]

{ #category : #accessing }
AJx86NEG >> opCode1 [
	^ 16rF6
]

{ #category : #accessing }
AJx86NEG >> opCodeR [
	^ 16r3
]
