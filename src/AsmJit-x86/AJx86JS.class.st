"
Jump if Signed (SF=1)
"
Class {
	#name : #AJx86JS,
	#superclass : #AJx86ConditionalJumpInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86JS class >> description [
	^ #(#js #cjmp 0 0 "R" 0 "C1" 16r00000008 0 )
]

{ #category : #accessing }
AJx86JS class >> mnemonic [
	^ #js
]
