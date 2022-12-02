"
Floating-Point Change Sign
"
Class {
	#name : #AJx86FCHS,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FCHS class >> description [
	^ #(#fchs #emit 0 0 "R" 0 "C1" 16r0000D9E0 0 )
]

{ #category : #accessing }
AJx86FCHS class >> mnemonic [
	^ #fchs
]

{ #category : #accessing }
AJx86FCHS >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FCHS >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FCHS >> name [
	^ #fchs
]

{ #category : #accessing }
AJx86FCHS >> opCode [
	^ 16rD9E0
]
