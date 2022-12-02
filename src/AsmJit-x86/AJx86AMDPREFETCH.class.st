"
Prefetch L1 Data-Cache Line
"
Class {
	#name : #AJx86AMDPREFETCH,
	#superclass : #AJx86MemoryInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86AMDPREFETCH class >> description [
	^ #(#amdprefetch #mem "op1" 2r1000000 0 "R" 0 "C1" 16r00000F0D 0 )
]

{ #category : #accessing }
AJx86AMDPREFETCH class >> mnemonic [
	^ #amdprefetch
]

{ #category : #accessing }
AJx86AMDPREFETCH >> opCode1 [
	^ 16rF0D
]

{ #category : #accessing }
AJx86AMDPREFETCH >> opCode2 [
	^ 16r0
]

{ #category : #accessing }
AJx86AMDPREFETCH >> opCodeR [
	^ 16r0
]
