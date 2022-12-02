"
Floating-Point Square Root
"
Class {
	#name : #AJx86FSQRT,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FSQRT class >> description [
	^ #(#fsqrt #emit 0 0 "R" 0 "C1" 16r0000D9FA 0 )
]

{ #category : #accessing }
AJx86FSQRT class >> mnemonic [
	^ #fsqrt
]

{ #category : #accessing }
AJx86FSQRT >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FSQRT >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FSQRT >> opCode [
	^ 16rD9FA
]
