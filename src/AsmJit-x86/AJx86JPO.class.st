"
Jump if Parity Odd (PF=0)
"
Class {
	#name : #AJx86JPO,
	#superclass : #AJx86ConditionalJumpInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86JPO class >> description [
	^ #(#jpo #cjmp 0 0 "R" 0 "C1" 16r0000000B 0 )
]

{ #category : #accessing }
AJx86JPO class >> mnemonic [
	^ #jpo
]
