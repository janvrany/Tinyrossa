"
Convert to Sign-Extended
"
Class {
	#name : #AJx86CBW,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CBW class >> description [
	^ #(#cbw #emit 0 0 "R" 0 "C1" 16r66000098 0 )
]

{ #category : #accessing }
AJx86CBW class >> mnemonic [
	^ #cbw
]

{ #category : #accessing }
AJx86CBW >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86CBW >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86CBW >> opCode [
	^ 16r66000098
]
