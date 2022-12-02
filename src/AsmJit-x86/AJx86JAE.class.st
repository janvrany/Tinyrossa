"
Jump if Above or Equal (CF=0)
"
Class {
	#name : #AJx86JAE,
	#superclass : #AJx86ConditionalJumpInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86JAE class >> description [
	^ #(#jae #cjmp 0 0 "R" 0 "C1" 16r00000003 0 )
]

{ #category : #accessing }
AJx86JAE class >> mnemonic [
	^ #jae
]
