"
Bit Test
"
Class {
	#name : #AJx86BT,
	#superclass : #AJx86BitTestInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86BT class >> description [
	^ #(#bt #bt "op1" 2r1001110 "op2" 2r10001110 "R" 4 "C1" 16r00000FA3 "C2" 16r00000FBA )
]

{ #category : #accessing }
AJx86BT class >> mnemonic [
	^ #bt
]

{ #category : #accessing }
AJx86BT >> opCode1 [
	^ 16rFA3
]

{ #category : #accessing }
AJx86BT >> opCode2 [
	^ 16rFBA
]

{ #category : #accessing }
AJx86BT >> opCodeR [
	^ 16r4
]
