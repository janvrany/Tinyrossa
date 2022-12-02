"
Jump if not Above or Equal (CF=1)
"
Class {
	#name : #AJx86JNAE,
	#superclass : #AJx86ConditionalJumpInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86JNAE class >> description [
	^ #(#jnae #cjmp 0 0 "R" 0 "C1" 16r00000002 0 )
]

{ #category : #accessing }
AJx86JNAE class >> mnemonic [
	^ #jnae
]
