"
Unsigned Multiply
"
Class {
	#name : #AJx86MUL,
	#superclass : #AJx86RmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86MUL class >> description [
	^ #(#mul #rm 0 0 "R" 4 "C1" 16r000000F6 0 )
]

{ #category : #accessing }
AJx86MUL class >> mnemonic [
	^ #mul
]

{ #category : #accessing }
AJx86MUL >> opCode1 [
	^ 16rF6
]

{ #category : #accessing }
AJx86MUL >> opCodeR [
	^ 16r4
]
