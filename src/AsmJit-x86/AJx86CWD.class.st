"
Convert to Sign-Extended Word
"
Class {
	#name : #AJx86CWD,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CWD class >> description [
	^ #(#cwd #emit 0 0 "R" 0 "C1" 16r66000099 0 )
]

{ #category : #accessing }
AJx86CWD class >> mnemonic [
	^ #cwd
]

{ #category : #accessing }
AJx86CWD >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86CWD >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86CWD >> opCode [
	^ 16r66000099
]
