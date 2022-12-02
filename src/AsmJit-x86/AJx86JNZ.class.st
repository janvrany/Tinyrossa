"
Jump if not Zero (OF=1)
"
Class {
	#name : #AJx86JNZ,
	#superclass : #AJx86ConditionalJumpInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86JNZ class >> description [
	^ #(#jnz #cjmp 0 0 "R" 0 "C1" 16r00000005 0 )
]

{ #category : #accessing }
AJx86JNZ class >> mnemonic [
	^ #jnz
]
