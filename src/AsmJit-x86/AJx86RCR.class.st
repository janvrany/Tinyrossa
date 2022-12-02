"
Rotate Right
"
Class {
	#name : #AJx86RCR,
	#superclass : #AJx86RotInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86RCR class >> description [
	^ #(#rcr #rot 0 0 "R" 3 0 0 )
]

{ #category : #accessing }
AJx86RCR class >> mnemonic [
	^ #rcr
]

{ #category : #accessing }
AJx86RCR >> opCodeR [
	^ 16r3
]
