"
Jump if not Parity (PF=0)
"
Class {
	#name : #AJx86JNP,
	#superclass : #AJx86ConditionalJumpInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86JNP class >> description [
	^ #(#jnp #cjmp 0 0 "R" 0 "C1" 16r0000000B 0 )
]

{ #category : #accessing }
AJx86JNP class >> mnemonic [
	^ #jnp
]
