"
Floating-Point Compute y * lb(x) / y * log2(x)
"
Class {
	#name : #AJx86FYL2X,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FYL2X class >> description [
	^ #(#fyl2x #emit 0 0 "R" 0 "C1" 16r0000D9F1 0 )
]

{ #category : #accessing }
AJx86FYL2X class >> mnemonic [
	^ #fyl2x
]

{ #category : #accessing }
AJx86FYL2X >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FYL2X >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FYL2X >> opCode [
	^ 16rD9F1
]
