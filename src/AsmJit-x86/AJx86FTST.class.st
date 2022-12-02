"
Floating-Point Test
"
Class {
	#name : #AJx86FTST,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FTST class >> description [
	^ #(#ftst #emit 0 0 "R" 0 "C1" 16r0000D9E4 0 )
]

{ #category : #accessing }
AJx86FTST class >> mnemonic [
	^ #ftst
]

{ #category : #accessing }
AJx86FTST >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FTST >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FTST >> opCode [
	^ 16rD9E4
]
