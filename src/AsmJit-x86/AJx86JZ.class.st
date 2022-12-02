"
Jump if Zero (ZF=1)
"
Class {
	#name : #AJx86JZ,
	#superclass : #AJx86ConditionalJumpInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86JZ class >> description [
	^ #(#jz #cjmp 0 0 "R" 0 "C1" 16r00000004 0 )
]

{ #category : #accessing }
AJx86JZ class >> mnemonic [
	^ #jz
]
