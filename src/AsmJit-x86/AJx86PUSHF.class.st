"
Push lower 16Bits of the EFLAGS Register onto the Stack
"
Class {
	#name : #AJx86PUSHF,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86PUSHF class >> description [
	^ #(#pushf #emit 0 0 "R" 0 "C1" 16r6600009C 0 )
]

{ #category : #accessing }
AJx86PUSHF class >> mnemonic [
	^ #pushf
]

{ #category : #accessing }
AJx86PUSHF >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86PUSHF >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86PUSHF >> opCode [
	^ 16r6600009C
]
