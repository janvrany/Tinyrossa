"
Repea String Operation Prefix
"
Class {
	#name : #AJx86REPNE,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86REPNE class >> description [
	^ #(#repne #emit 0 0 "R" 0 "C1" 16r000000F2 0 )
]

{ #category : #accessing }
AJx86REPNE class >> mnemonic [
	^ #repne
]

{ #category : #accessing }
AJx86REPNE >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86REPNE >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86REPNE >> opCode [
	^ 16rF2
]
