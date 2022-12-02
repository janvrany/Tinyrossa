"
Decimal Adjust after Subtraction
"
Class {
	#name : #AJx86DAS,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86DAS class >> description [
	^ #(#das #emit "op1" 2r1000000000 0 "R" 0 "C1" 16r0000002F 0 )
]

{ #category : #accessing }
AJx86DAS class >> mnemonic [
	^ #das
]

{ #category : #accessing }
AJx86DAS >> is32BitOnly [
	^ true
]

{ #category : #accessing }
AJx86DAS >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86DAS >> opCode [
	^ 16r2F
]
