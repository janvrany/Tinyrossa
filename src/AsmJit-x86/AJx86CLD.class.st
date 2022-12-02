"
Clear Direction Flag
"
Class {
	#name : #AJx86CLD,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CLD class >> description [
	^ #(#cld #emit 0 0 "R" 0 "C1" 16r000000FC 0 )
]

{ #category : #accessing }
AJx86CLD class >> mnemonic [
	^ #cld
]

{ #category : #accessing }
AJx86CLD >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86CLD >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86CLD >> opCode [
	^ 16rFC
]
