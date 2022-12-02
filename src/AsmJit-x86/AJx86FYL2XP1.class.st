"
Floating-Point Compute y * lb(x+1) / y * log2(x+1)
"
Class {
	#name : #AJx86FYL2XP1,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FYL2XP1 class >> description [
	^ #(#fyl2xp1 #emit 0 0 "R" 0 "C1" 16r0000D9F9 0 )
]

{ #category : #accessing }
AJx86FYL2XP1 class >> mnemonic [
	^ #fyl2xp1
]

{ #category : #accessing }
AJx86FYL2XP1 >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FYL2XP1 >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FYL2XP1 >> opCode [
	^ 16rD9F9
]
