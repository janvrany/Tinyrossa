"
Jump if not Equal (ZF=0)
"
Class {
	#name : #AJx86JNE,
	#superclass : #AJx86ConditionalJumpInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86JNE class >> description [
	^ #(#jne #cjmp 0 0 "R" 0 "C1" 16r00000005 0 )
]

{ #category : #accessing }
AJx86JNE class >> mnemonic [
	^ #jne
]
