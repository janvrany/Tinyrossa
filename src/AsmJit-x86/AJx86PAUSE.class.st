"
Spin Loop Hint
"
Class {
	#name : #AJx86PAUSE,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86PAUSE class >> description [
	^ #(#pause #emit 0 0 "R" 0 "C1" 16rF3000090 0 )
]

{ #category : #accessing }
AJx86PAUSE class >> mnemonic [
	^ #pause
]

{ #category : #accessing }
AJx86PAUSE >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86PAUSE >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86PAUSE >> opCode [
	^ 16rF3000090
]
