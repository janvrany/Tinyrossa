"
Decimal Adjust after Addition
"
Class {
	#name : #AJx86DAA,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86DAA class >> description [
	^ #(#daa #emit "op1" 2r1000000000 0 "R" 0 "C1" 16r00000027 0 )
]

{ #category : #accessing }
AJx86DAA class >> mnemonic [
	^ #daa
]

{ #category : #accessing }
AJx86DAA >> is32BitOnly [
	^ true
]

{ #category : #accessing }
AJx86DAA >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86DAA >> opCode [
	^ 16r27
]
