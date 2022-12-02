"
Prefetch L1 Data-Cache Line and Set Cache-Line Modified
"
Class {
	#name : #AJx86AMDPREFETCHW,
	#superclass : #AJx86MemoryInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86AMDPREFETCHW class >> description [
	^ #(#amdprefetchw #mem "op1" 2r1000000 0 "R" 1 "C1" 16r00000F0D 0 )
]

{ #category : #accessing }
AJx86AMDPREFETCHW class >> mnemonic [
	^ #amdprefetchw
]

{ #category : #accessing }
AJx86AMDPREFETCHW >> opCode1 [
	^ 16rF0D
]

{ #category : #accessing }
AJx86AMDPREFETCHW >> opCode2 [
	^ 16r0
]

{ #category : #accessing }
AJx86AMDPREFETCHW >> opCodeR [
	^ 16r1
]
