"
Jump if not Above (CF=1 or ZF=1)
"
Class {
	#name : #AJx86JNA,
	#superclass : #AJx86ConditionalJumpInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86JNA class >> description [
	^ #(#jna #cjmp 0 0 "R" 0 "C1" 16r00000006 0 )
]

{ #category : #accessing }
AJx86JNA class >> mnemonic [
	^ #jna
]
