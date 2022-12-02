"
Set Up Monitor Address
"
Class {
	#name : #AJx86MONITOR,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE3'
}

{ #category : #accessing }
AJx86MONITOR class >> description [
	^ #(#monitor #emit 0 0 "R" 0 "C1" 16r000F01C8 0 )
]

{ #category : #accessing }
AJx86MONITOR class >> mnemonic [
	^ #monitor
]

{ #category : #accessing }
AJx86MONITOR >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86MONITOR >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86MONITOR >> opCode [
	^ 16rF01C8
]
