"
Decrement by 1
"
Class {
	#name : #AJx86DEC,
	#superclass : #AJx86IncrementDecrementInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86DEC class >> description [
	^ #(#dec #incdec 0 0 "R" 1 "C1" 16r00000048 "C2" 16r000000FE )
]

{ #category : #accessing }
AJx86DEC class >> mnemonic [
	^ #dec
]

{ #category : #accessing }
AJx86DEC >> isDecrement [
	^ true
]

{ #category : #accessing }
AJx86DEC >> opCode [
	^ 16r48
]
