"
Floating-Point Restore x87 FPU State
"
Class {
	#name : #AJx86FRSTOR,
	#superclass : #AJx86MemoryInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FRSTOR class >> description [
	^ #(#frstor #mem "op1" 2r1000000 0 "R" 4 "C1" 16r000000DD 0 )
]

{ #category : #accessing }
AJx86FRSTOR class >> mnemonic [
	^ #frstor
]

{ #category : #accessing }
AJx86FRSTOR >> opCode1 [
	^ 16rDD
]

{ #category : #accessing }
AJx86FRSTOR >> opCode2 [
	^ 16r0
]

{ #category : #accessing }
AJx86FRSTOR >> opCodeR [
	^ 16r4
]
