"
Prefetch Data Into Caches
"
Class {
	#name : #AJx86PREFETCH,
	#superclass : #AJx86MmuInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86PREFETCH class >> arity [
	^ 1 to: 1
]

{ #category : #accessing }
AJx86PREFETCH class >> description [
	^ #(#prefetch #mmuPrefetch "op1" 2r1000000 "op2" 2r10000000 "R" 0 0 0 )
]

{ #category : #accessing }
AJx86PREFETCH class >> group [
	^ #mmuPrefetch
]

{ #category : #accessing }
AJx86PREFETCH class >> mnemonic [
	^ #prefetch
]
