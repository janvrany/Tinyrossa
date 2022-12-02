"
Jump if Parity or Even (PF=1)
"
Class {
	#name : #AJx86JPE,
	#superclass : #AJx86ConditionalJumpInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86JPE class >> description [
	^ #(#jpe #cjmp 0 0 "R" 0 "C1" 16r0000000A 0 )
]

{ #category : #accessing }
AJx86JPE class >> mnemonic [
	^ #jpe
]
