"
I am the general superclass for the x86 Memory instruction group.
"
Class {
	#name : #AJx86MemoryInstruction,
	#superclass : #AJx86NewInstruction,
	#instVars : [
		'opCode2',
		'opCode1',
		'opCodeR'
	],
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #accessing }
AJx86MemoryInstruction class >> arity [
	^ 1 to: 1
]

{ #category : #accessing }
AJx86MemoryInstruction class >> group [
	^ #mem
]

{ #category : #'as yet unclassified' }
AJx86MemoryInstruction class >> isAbstract [
	^ self == AJx86MemoryInstruction
]

{ #category : #'code generation' }
AJx86MemoryInstruction >> emitCode: asm [
	"force new code generation"
	self flag: 'Compatibility code'.
	description ifNotNil: [
		opCodeR := description opCodeR.
		opCode1 := description opCode1.
		opCode2 := description opCode2.
		description := nil ].
	^ super emitCode: asm
]

{ #category : #'code generation' }
AJx86MemoryInstruction >> emitMemory: memory [
	self assert: (self opCode2 = 0 or: [ self opCode2 = 1 ]).
	self
		emitX86RM: self opCode1
		size: self opCode2 << 3
		registerOrCode: self opCodeR
		rm: memory

]

{ #category : #accessing }
AJx86MemoryInstruction >> opCode1 [
	^ opCode1
]

{ #category : #accessing }
AJx86MemoryInstruction >> opCode2 [
	^ opCode2
]

{ #category : #accessing }
AJx86MemoryInstruction >> opCodeR [
	^ opCodeR
]
