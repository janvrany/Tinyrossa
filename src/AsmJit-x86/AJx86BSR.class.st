"
Bit Scan Reverse
"
Class {
	#name : #AJx86BSR,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86BSR class >> description [
	^ #(#bsr #rrm 0 0 "R" 0 "C1" 16r00000FBD 0 )
]

{ #category : #accessing }
AJx86BSR class >> mnemonic [
	^ #bsr
]

{ #category : #accessing }
AJx86BSR >> opCode1 [
	^ 16rFBD
]
