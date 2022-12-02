"
Jump if no Carry (CF=0)
"
Class {
	#name : #AJx86JNC,
	#superclass : #AJx86ConditionalJumpInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86JNC class >> description [
	^ #(#jnc #cjmp 0 0 "R" 0 "C1" 16r00000003 0 )
]

{ #category : #accessing }
AJx86JNC class >> mnemonic [
	^ #jnc
]
