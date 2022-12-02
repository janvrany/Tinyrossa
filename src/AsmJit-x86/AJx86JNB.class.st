"
Jump if not Below (CF=0)
"
Class {
	#name : #AJx86JNB,
	#superclass : #AJx86ConditionalJumpInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86JNB class >> description [
	^ #(#jnb #cjmp 0 0 "R" 0 "C1" 16r00000003 0 )
]

{ #category : #accessing }
AJx86JNB class >> mnemonic [
	^ #jnb
]
