"
Jump if not Greater (ZF=1 or SF~~OF)
"
Class {
	#name : #AJx86JNG,
	#superclass : #AJx86ConditionalJumpInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86JNG class >> description [
	^ #(#jng #cjmp 0 0 "R" 0 "C1" 16r0000000E 0 )
]

{ #category : #accessing }
AJx86JNG class >> mnemonic [
	^ #jng
]
