"
Jump if Above (CF=0 and ZF=0)
"
Class {
	#name : #AJx86JA,
	#superclass : #AJx86ConditionalJumpInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86JA class >> description [
	^ #(#ja #cjmp 0 0 "R" 0 "C1" 16r00000007 0 )
]

{ #category : #accessing }
AJx86JA class >> mnemonic [
	^ #ja
]
