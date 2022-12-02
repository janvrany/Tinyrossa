"
Floating-Point Partial Arctangent
"
Class {
	#name : #AJx86FPATAN,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FPATAN class >> description [
	^ #(#fpatan #emit 0 0 "R" 0 "C1" 16r0000D9F3 0 )
]

{ #category : #accessing }
AJx86FPATAN class >> mnemonic [
	^ #fpatan
]

{ #category : #accessing }
AJx86FPATAN >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FPATAN >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FPATAN >> opCode [
	^ 16rD9F3
]
