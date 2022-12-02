"
Jump if Overflow (OF=1)
"
Class {
	#name : #AJx86JO,
	#superclass : #AJx86ConditionalJumpInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86JO class >> description [
	^ #(#jo #cjmp 0 0 "R" 0 0 0 )
]

{ #category : #accessing }
AJx86JO class >> mnemonic [
	^ #jo
]
