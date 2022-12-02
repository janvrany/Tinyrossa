"
Bit Test and Set
"
Class {
	#name : #AJx86BTS,
	#superclass : #AJx86BitTestInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86BTS class >> description [
	^ #(#bts #bt "op1" 2r1001110 "op2" 2r10001110 "R" 5 "C1" 16r00000FAB "C2" 16r00000FBA )
]

{ #category : #accessing }
AJx86BTS class >> mnemonic [
	^ #bts
]

{ #category : #accessing }
AJx86BTS >> opCode1 [
	^ 16rFAB
]

{ #category : #accessing }
AJx86BTS >> opCode2 [
	^ 16rFBA
]

{ #category : #accessing }
AJx86BTS >> opCodeR [
	^ 16r5
]
