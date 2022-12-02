"
Monitor Wait
"
Class {
	#name : #AJx86MWAIT,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE3'
}

{ #category : #accessing }
AJx86MWAIT class >> description [
	^ #(#mwait #emit 0 0 "R" 0 "C1" 16r000F01C9 0 )
]

{ #category : #accessing }
AJx86MWAIT class >> mnemonic [
	^ #mwait
]

{ #category : #accessing }
AJx86MWAIT >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86MWAIT >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86MWAIT >> opCode [
	^ 16rF01C9
]
