"
Floating-Point Round to Integer
"
Class {
	#name : #AJx86FRNDINT,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FRNDINT class >> description [
	^ #(#frndint #emit 0 0 "R" 0 "C1" 16r0000D9FC 0 )
]

{ #category : #accessing }
AJx86FRNDINT class >> mnemonic [
	^ #frndint
]

{ #category : #accessing }
AJx86FRNDINT >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FRNDINT >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FRNDINT >> opCode [
	^ 16rD9FC
]
