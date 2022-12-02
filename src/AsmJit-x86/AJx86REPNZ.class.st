"
Repea String Operation Prefix
"
Class {
	#name : #AJx86REPNZ,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86REPNZ class >> description [
	^ #(#repnz #emit 0 0 "R" 0 "C1" 16r000000F2 0 )
]

{ #category : #accessing }
AJx86REPNZ class >> mnemonic [
	^ #repnz
]

{ #category : #accessing }
AJx86REPNZ >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86REPNZ >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86REPNZ >> opCode [
	^ 16rF2
]
