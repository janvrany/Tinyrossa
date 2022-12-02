"
Floating-Point Partial Tangent
"
Class {
	#name : #AJx86FPTAN,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FPTAN class >> description [
	^ #(#fptan #emit 0 0 "R" 0 "C1" 16r0000D9F2 0 )
]

{ #category : #accessing }
AJx86FPTAN class >> mnemonic [
	^ #fptan
]

{ #category : #accessing }
AJx86FPTAN >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FPTAN >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FPTAN >> opCode [
	^ 16rD9F2
]
