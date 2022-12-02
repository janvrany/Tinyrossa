"
Floating-Point Sine
"
Class {
	#name : #AJx86FSIN,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FSIN class >> description [
	^ #(#fsin #emit 0 0 "R" 0 "C1" 16r0000D9FE 0 )
]

{ #category : #accessing }
AJx86FSIN class >> mnemonic [
	^ #fsin
]

{ #category : #accessing }
AJx86FSIN >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FSIN >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FSIN >> opCode [
	^ 16rD9FE
]
