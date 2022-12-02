"
Repea String Operation Prefix
"
Class {
	#name : #AJx86REPE,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86REPE class >> description [
	^ #(#repe #emit 0 0 "R" 0 "C1" 16r000000F3 0 )
]

{ #category : #accessing }
AJx86REPE class >> mnemonic [
	^ #repe
]

{ #category : #accessing }
AJx86REPE >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86REPE >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86REPE >> opCode [
	^ 16rF3
]
