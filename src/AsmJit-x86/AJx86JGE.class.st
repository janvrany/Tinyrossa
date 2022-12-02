"
Jump if Greater or Equal (SF=OF)
"
Class {
	#name : #AJx86JGE,
	#superclass : #AJx86ConditionalJumpInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86JGE class >> description [
	^ #(#jge #cjmp 0 0 "R" 0 "C1" 16r0000000D 0 )
]

{ #category : #accessing }
AJx86JGE class >> mnemonic [
	^ #jge
]
