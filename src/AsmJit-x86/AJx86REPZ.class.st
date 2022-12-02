"
Repea String Operation Prefix
"
Class {
	#name : #AJx86REPZ,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86REPZ class >> description [
	^ #(#repz #emit 0 0 "R" 0 "C1" 16r000000F3 0 )
]

{ #category : #accessing }
AJx86REPZ class >> mnemonic [
	^ #repz
]

{ #category : #accessing }
AJx86REPZ >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86REPZ >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86REPZ >> opCode [
	^ 16rF3
]
