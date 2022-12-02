"
Increment by 1
"
Class {
	#name : #AJx86INC,
	#superclass : #AJx86IncrementDecrementInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86INC class >> description [
	^ #(#inc #incdec 0 0 "R" 0 "C1" 16r00000040 "C2" 16r000000FE )
]

{ #category : #accessing }
AJx86INC class >> mnemonic [
	^ #inc
]

{ #category : #accessing }
AJx86INC >> isDecrement [
	^ false
]

{ #category : #accessing }
AJx86INC >> opCode [
	^ 16r40
]
