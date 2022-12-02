"
Jump if no Less or Euqal (ZF=0 and SF=OF)
"
Class {
	#name : #AJx86JNLE,
	#superclass : #AJx86ConditionalJumpInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86JNLE class >> description [
	^ #(#jnle #cjmp 0 0 "R" 0 "C1" 16r0000000F 0 )
]

{ #category : #accessing }
AJx86JNLE class >> mnemonic [
	^ #jnle
]
