"
Floating-Point Load Constant +0.0
"
Class {
	#name : #AJx86FLDZ,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FLDZ class >> description [
	^ #(#fldz #emit 0 0 "R" 0 "C1" 16r0000D9EE 0 )
]

{ #category : #accessing }
AJx86FLDZ class >> mnemonic [
	^ #fldz
]

{ #category : #accessing }
AJx86FLDZ >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FLDZ >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FLDZ >> opCode [
	^ 16rD9EE
]
