"
Convert to Sign-Extended Quadword
"
Class {
	#name : #AJx86CQO,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CQO class >> description [
	^ #(#cqo #emit "op1" 2r100000000 0 "R" 0 "C1" 16r48000099 0 )
]

{ #category : #accessing }
AJx86CQO class >> mnemonic [
	^ #cqo
]

{ #category : #accessing }
AJx86CQO >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86CQO >> is64BitOnly [
	^ true
]

{ #category : #accessing }
AJx86CQO >> opCode [
	^ 16r48000099
]
