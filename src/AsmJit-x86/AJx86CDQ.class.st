"
Convert to Sign-Extended
"
Class {
	#name : #AJx86CDQ,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86CDQ class >> description [
	^ #(#cdq #emit 0 0 "R" 0 "C1" 16r00000099 0 )
]

{ #category : #accessing }
AJx86CDQ class >> mnemonic [
	^ #cdq
]

{ #category : #accessing }
AJx86CDQ >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86CDQ >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86CDQ >> opCode [
	^ 16r99
]
