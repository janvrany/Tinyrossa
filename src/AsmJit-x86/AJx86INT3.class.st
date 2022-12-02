"
Call to Interrupt Proceedure
"
Class {
	#name : #AJx86INT3,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86INT3 class >> description [
	^ #(#int3 #emit 0 0 "R" 0 "C1" 16r000000CC 0 )
]

{ #category : #accessing }
AJx86INT3 class >> mnemonic [
	^ #int3
]

{ #category : #accessing }
AJx86INT3 >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86INT3 >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86INT3 >> opCode [
	^ 16rCC
]
