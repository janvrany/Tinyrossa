"
Set Direction Flag
"
Class {
	#name : #AJx86STD,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86STD class >> description [
	^ #(#std #emit 0 0 "R" 0 "C1" 16r000000FD 0 )
]

{ #category : #accessing }
AJx86STD class >> mnemonic [
	^ #std
]

{ #category : #accessing }
AJx86STD >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86STD >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86STD >> opCode [
	^ 16rFD
]
