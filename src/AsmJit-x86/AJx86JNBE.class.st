"
Jump if not Below or Equal (CF=0 and ZF=0)
"
Class {
	#name : #AJx86JNBE,
	#superclass : #AJx86ConditionalJumpInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86JNBE class >> description [
	^ #(#jnbe #cjmp 0 0 "R" 0 "C1" 16r00000007 0 )
]

{ #category : #accessing }
AJx86JNBE class >> mnemonic [
	^ #jnbe
]
