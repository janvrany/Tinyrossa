"
Convert to Sign-Extended Word
"
Class {
	#name : #AJx86CWDE,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CWDE class >> description [
	^ #(#cwde #emit 0 0 "R" 0 "C1" 16r00000098 0 )
]

{ #category : #accessing }
AJx86CWDE class >> mnemonic [
	^ #cwde
]

{ #category : #accessing }
AJx86CWDE >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86CWDE >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86CWDE >> opCode [
	^ 16r98
]
