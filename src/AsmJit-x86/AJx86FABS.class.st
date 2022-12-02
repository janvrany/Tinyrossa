"
Floating-Point Absolute Value
"
Class {
	#name : #AJx86FABS,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FABS class >> description [
	^ #(#fabs #emit 0 0 "R" 0 "C1" 16r0000D9E1 0 )
]

{ #category : #accessing }
AJx86FABS class >> mnemonic [
	^ #fabs
]

{ #category : #accessing }
AJx86FABS >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FABS >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FABS >> opCode [
	^ 16rD9E1
]
