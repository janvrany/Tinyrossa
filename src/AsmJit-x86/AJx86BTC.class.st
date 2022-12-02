"
Bit Test and Complement
"
Class {
	#name : #AJx86BTC,
	#superclass : #AJx86BitTestInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86BTC class >> description [
	^ #(#btc #bt "op1" 2r1001110 "op2" 2r10001110 "R" 7 "C1" 16r00000FBB "C2" 16r00000FBA )
]

{ #category : #accessing }
AJx86BTC class >> mnemonic [
	^ #btc
]

{ #category : #accessing }
AJx86BTC >> opCode1 [
	^ 16rFBB
]

{ #category : #accessing }
AJx86BTC >> opCode2 [
	^ 16rFBA
]

{ #category : #accessing }
AJx86BTC >> opCodeR [
	^ 16r7
]
