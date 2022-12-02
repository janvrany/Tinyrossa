"
Jump if no less (SF=OF)
"
Class {
	#name : #AJx86JNL,
	#superclass : #AJx86ConditionalJumpInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86JNL class >> description [
	^ #(#jnl #cjmp 0 0 "R" 0 "C1" 16r0000000D 0 )
]

{ #category : #accessing }
AJx86JNL class >> mnemonic [
	^ #jnl
]
