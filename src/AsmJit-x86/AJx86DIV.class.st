"
Unsigned Divide
"
Class {
	#name : #AJx86DIV,
	#superclass : #AJx86RmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86DIV class >> description [
	^ #(#div #rm 0 0 "R" 6 "C1" 16r000000F6 0 )
]

{ #category : #accessing }
AJx86DIV class >> mnemonic [
	^ #div
]

{ #category : #accessing }
AJx86DIV >> opCode1 [
	^ 16rF6
]

{ #category : #accessing }
AJx86DIV >> opCodeR [
	^ 16r6
]
