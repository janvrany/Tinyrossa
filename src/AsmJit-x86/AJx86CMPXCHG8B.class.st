"
Compare and Exchange 8 Bytes
"
Class {
	#name : #AJx86CMPXCHG8B,
	#superclass : #AJx86MemoryInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMPXCHG8B class >> description [
	^ #(#cmpxchg8b #mem "op1" 2r1000000 0 "R" 1 "C1" 16r00000FC7 0 )
]

{ #category : #accessing }
AJx86CMPXCHG8B class >> mnemonic [
	^ #cmpxchg8b
]

{ #category : #accessing }
AJx86CMPXCHG8B >> opCode1 [
	^ 16rFC7
]

{ #category : #accessing }
AJx86CMPXCHG8B >> opCode2 [
	^ 16r0
]

{ #category : #accessing }
AJx86CMPXCHG8B >> opCodeR [
	^ 16r1
]
