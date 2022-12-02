"
Compare and Exchange
"
Class {
	#name : #AJx86CMPXCHG,
	#superclass : #AJx86RmrInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMPXCHG class >> description [
	^ #(#cmpxchg #rmr 0 0 "R" 0 "C1" 16r00000FB0 0 )
]

{ #category : #accessing }
AJx86CMPXCHG class >> mnemonic [
	^ #cmpxchg
]

{ #category : #accessing }
AJx86CMPXCHG >> opCode1 [
	^ 16rFB0
]
