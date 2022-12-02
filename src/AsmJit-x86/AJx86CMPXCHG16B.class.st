"
Compare and Exchange 16 Bytes
"
Class {
	#name : #AJx86CMPXCHG16B,
	#superclass : #AJx86MemoryInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMPXCHG16B class >> description [
	^ #(#cmpxchg16b #mem "op1" 2r1000000 0 "R" 1 "C1" 16r00000FC7 "C2" 16r00000001 )
]

{ #category : #accessing }
AJx86CMPXCHG16B class >> mnemonic [
	^ #cmpxchg16b
]

{ #category : #accessing }
AJx86CMPXCHG16B >> opCode1 [
	^ 16rFC7
]

{ #category : #accessing }
AJx86CMPXCHG16B >> opCode2 [
	^ 16r1
]

{ #category : #accessing }
AJx86CMPXCHG16B >> opCodeR [
	^ 16r1
]
