"
Jump if Parity (PF=1)
"
Class {
	#name : #AJx86JP,
	#superclass : #AJx86ConditionalJumpInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86JP class >> description [
	^ #(#jp #cjmp 0 0 "R" 0 "C1" 16r0000000A 0 )
]

{ #category : #accessing }
AJx86JP class >> mnemonic [
	^ #jp
]
