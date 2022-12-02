"
Delete Proceedure Stack Frame
"
Class {
	#name : #AJx86LEAVE,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86LEAVE class >> description [
	^ #(#leave #emit 0 0 "R" 0 "C1" 16r000000C9 0 )
]

{ #category : #accessing }
AJx86LEAVE class >> mnemonic [
	^ #leave
]

{ #category : #accessing }
AJx86LEAVE >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86LEAVE >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86LEAVE >> opCode [
	^ 16rC9
]
