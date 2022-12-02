"
Jump if not Greater or Equal (SF~~OF)
"
Class {
	#name : #AJx86JNGE,
	#superclass : #AJx86ConditionalJumpInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86JNGE class >> description [
	^ #(#jnge #cjmp 0 0 "R" 0 "C1" 16r0000000C 0 )
]

{ #category : #accessing }
AJx86JNGE class >> mnemonic [
	^ #jnge
]
