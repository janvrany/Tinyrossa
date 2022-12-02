"
Bit Test and Reset
"
Class {
	#name : #AJx86BTR,
	#superclass : #AJx86BitTestInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86BTR class >> description [
	^ #(#btr #bt "op1" 2r1001110 "op2" 2r10001110 "R" 6 "C1" 16r00000FB3 "C2" 16r00000FBA )
]

{ #category : #accessing }
AJx86BTR class >> mnemonic [
	^ #btr
]

{ #category : #accessing }
AJx86BTR >> opCode1 [
	^ 16rFB3
]

{ #category : #accessing }
AJx86BTR >> opCode2 [
	^ 16rFBA
]

{ #category : #accessing }
AJx86BTR >> opCodeR [
	^ 16r6
]
