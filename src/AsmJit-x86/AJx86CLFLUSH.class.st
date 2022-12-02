"
Cache Line Flush
"
Class {
	#name : #AJx86CLFLUSH,
	#superclass : #AJx86MemoryInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86CLFLUSH class >> description [
	^ #(#clflush #mem "op1" 2r1000000 0 "R" 7 "C1" 16r00000FAE 0 )
]

{ #category : #accessing }
AJx86CLFLUSH class >> mnemonic [
	^ #clflush
]

{ #category : #accessing }
AJx86CLFLUSH >> opCode1 [
	^ 16rFAE
]

{ #category : #accessing }
AJx86CLFLUSH >> opCode2 [
	^ 16r0
]

{ #category : #accessing }
AJx86CLFLUSH >> opCodeR [
	^ 16r7
]
