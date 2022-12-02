"
Jump if Below or Equal (CF=1 ZF=1)
"
Class {
	#name : #AJx86JBE,
	#superclass : #AJx86ConditionalJumpInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86JBE class >> description [
	^ #(#jbe #cjmp 0 0 "R" 0 "C1" 16r00000006 0 )
]

{ #category : #accessing }
AJx86JBE class >> mnemonic [
	^ #jbe
]
