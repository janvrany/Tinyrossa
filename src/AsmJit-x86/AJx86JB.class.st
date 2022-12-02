"
Jump if Below (CF=1)
"
Class {
	#name : #AJx86JB,
	#superclass : #AJx86ConditionalJumpInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86JB class >> description [
	^ #(#jb #cjmp 0 0 "R" 0 "C1" 16r00000002 0 )
]

{ #category : #accessing }
AJx86JB class >> mnemonic [
	^ #jb
]
