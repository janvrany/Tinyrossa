"
Complement Carry Flag
"
Class {
	#name : #AJx86CMC,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMC class >> description [
	^ #(#cmc #emit 0 0 "R" 0 "C1" 16r000000F5 0 )
]

{ #category : #accessing }
AJx86CMC class >> mnemonic [
	^ #cmc
]

{ #category : #accessing }
AJx86CMC >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86CMC >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86CMC >> opCode [
	^ 16rF5
]
