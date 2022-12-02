"
Bit Scan Forward
"
Class {
	#name : #AJx86BSF,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86BSF class >> description [
	^ #(#bsf #rrm 0 0 "R" 0 "C1" 16r00000FBC 0 )
]

{ #category : #accessing }
AJx86BSF class >> mnemonic [
	^ #bsf
]

{ #category : #accessing }
AJx86BSF >> opCode1 [
	^ 16rFBC
]
