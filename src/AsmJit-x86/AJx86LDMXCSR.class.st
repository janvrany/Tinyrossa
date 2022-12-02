"
Load MXCSR Register
"
Class {
	#name : #AJx86LDMXCSR,
	#superclass : #AJx86MemoryInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86LDMXCSR class >> description [
	^ #(#ldmxcsr #mem "op1" 2r1000000 0 "R" 2 "C1" 16r00000FAE 0 )
]

{ #category : #accessing }
AJx86LDMXCSR class >> mnemonic [
	^ #ldmxcsr
]

{ #category : #accessing }
AJx86LDMXCSR >> opCode1 [
	^ 16rFAE
]

{ #category : #accessing }
AJx86LDMXCSR >> opCode2 [
	^ 16r0
]

{ #category : #accessing }
AJx86LDMXCSR >> opCodeR [
	^ 16r2
]
