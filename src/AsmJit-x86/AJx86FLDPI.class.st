"
Floating-Point Load Constant Pi
"
Class {
	#name : #AJx86FLDPI,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FLDPI class >> description [
	^ #(#fldpi #emit 0 0 "R" 0 "C1" 16r0000D9EB 0 )
]

{ #category : #accessing }
AJx86FLDPI class >> mnemonic [
	^ #fldpi
]

{ #category : #accessing }
AJx86FLDPI >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FLDPI >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FLDPI >> opCode [
	^ 16rD9EB
]
