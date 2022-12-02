"
Store MXCSR Register State
"
Class {
	#name : #AJx86STMXCSR,
	#superclass : #AJx86MemoryInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86STMXCSR class >> description [
	^ #(#stmxcsr #mem "op1" 2r1000000 0 "R" 3 "C1" 16r00000FAE 0 )
]

{ #category : #accessing }
AJx86STMXCSR class >> mnemonic [
	^ #stmxcsr
]

{ #category : #accessing }
AJx86STMXCSR >> opCode1 [
	^ 16rFAE
]

{ #category : #accessing }
AJx86STMXCSR >> opCode2 [
	^ 16r0
]

{ #category : #accessing }
AJx86STMXCSR >> opCodeR [
	^ 16r3
]
