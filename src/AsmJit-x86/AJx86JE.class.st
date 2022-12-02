"
Jump if Equal (ZF=1)
"
Class {
	#name : #AJx86JE,
	#superclass : #AJx86ConditionalJumpInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86JE class >> description [
	^ #(#je #cjmp 0 0 "R" 0 "C1" 16r00000004 0 )
]

{ #category : #accessing }
AJx86JE class >> mnemonic [
	^ #je
]
