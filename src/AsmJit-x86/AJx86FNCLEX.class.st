"
Clear Exceptions
"
Class {
	#name : #AJx86FNCLEX,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FNCLEX class >> description [
	^ #(#fnclex #emit 0 0 "R" 0 "C1" 16r0000DBE2 0 )
]

{ #category : #accessing }
AJx86FNCLEX class >> mnemonic [
	^ #fnclex
]

{ #category : #accessing }
AJx86FNCLEX >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FNCLEX >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FNCLEX >> opCode [
	^ 16rDBE2
]
