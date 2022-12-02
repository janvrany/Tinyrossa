"
Clear Carry Flag
"
Class {
	#name : #AJx86CLC,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CLC class >> description [
	^ #(#clc #emit 0 0 "R" 0 "C1" 16r000000F8 0 )
]

{ #category : #accessing }
AJx86CLC class >> mnemonic [
	^ #clc
]

{ #category : #accessing }
AJx86CLC >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86CLC >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86CLC >> opCode [
	^ 16rF8
]
