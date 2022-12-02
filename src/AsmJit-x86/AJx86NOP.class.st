"
No Operation
"
Class {
	#name : #AJx86NOP,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86NOP class >> description [
	^ #(#nop #emit 0 0 "R" 0 "C1" 16r00000090 0 )
]

{ #category : #accessing }
AJx86NOP class >> mnemonic [
	^ #nop
]

{ #category : #accessing }
AJx86NOP >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86NOP >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86NOP >> opCode [
	^ 16r90
]
