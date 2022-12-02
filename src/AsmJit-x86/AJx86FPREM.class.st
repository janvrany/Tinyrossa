"
Floating-Point Partial Remainder
"
Class {
	#name : #AJx86FPREM,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FPREM class >> description [
	^ #(#fprem #emit 0 0 "R" 0 "C1" 16r0000D9F8 0 )
]

{ #category : #accessing }
AJx86FPREM class >> mnemonic [
	^ #fprem
]

{ #category : #accessing }
AJx86FPREM >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FPREM >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FPREM >> opCode [
	^ 16rD9F8
]
