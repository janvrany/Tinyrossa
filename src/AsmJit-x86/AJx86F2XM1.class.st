"
Compute 2**x - 1
"
Class {
	#name : #AJx86F2XM1,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86F2XM1 class >> description [
	^ #(#f2xm1 #emit 0 0 "R" 0 "C1" 16r0000D9F0 0 )
]

{ #category : #accessing }
AJx86F2XM1 class >> mnemonic [
	^ #f2xm1
]

{ #category : #accessing }
AJx86F2XM1 >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86F2XM1 >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86F2XM1 >> opCode [
	^ 16rD9F0
]
