"
One's Complement Negation
"
Class {
	#name : #AJx86NOT,
	#superclass : #AJx86RmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86NOT class >> description [
	^ #(#not #rm 0 0 "R" 2 "C1" 16r000000F6 0 )
]

{ #category : #accessing }
AJx86NOT class >> mnemonic [
	^ #not
]

{ #category : #accessing }
AJx86NOT >> opCode1 [
	^ 16rF6
]

{ #category : #accessing }
AJx86NOT >> opCodeR [
	^ 16r2
]
