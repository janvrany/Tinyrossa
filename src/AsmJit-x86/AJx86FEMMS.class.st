Class {
	#name : #AJx86FEMMS,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FEMMS class >> description [
	^ #(#femms #emit 0 0 "R" 0 "C1" 16r00000F0E 0 )
]

{ #category : #accessing }
AJx86FEMMS class >> mnemonic [
	^ #femms
]

{ #category : #accessing }
AJx86FEMMS >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FEMMS >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FEMMS >> opCode [
	^ 16rF0E
]
