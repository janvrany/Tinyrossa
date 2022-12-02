Class {
	#name : #AJx86MmuMovInstruction,
	#superclass : #AJx86MmuInstruction,
	#instVars : [
		'source',
		'destination'
	],
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #accessing }
AJx86MmuMovInstruction class >> arity [
	^ 2 to: 2
]

{ #category : #accessing }
AJx86MmuMovInstruction class >> group [
	^ #mmuMov
]

{ #category : #testing }
AJx86MmuMovInstruction class >> isAbstract [
	^ self == AJx86MmuMovInstruction
]

{ #category : #printing }
AJx86MmuMovInstruction >> printOperandsOn: aStream [
	aStream
		space; nextPut: $(.
	destination printAsOperandOn: aStream.
	aStream space.
	source printAsOperandOn: aStream.
	aStream nextPut: $).
]
