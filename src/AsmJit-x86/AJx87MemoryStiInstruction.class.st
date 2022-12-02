"
I am the general superclass for x87 instructions loading Constants or Memory operands into the ST registers
"
Class {
	#name : #AJx87MemoryStiInstruction,
	#superclass : #AJx87MemoryInstruction,
	#instVars : [
		'opCode2'
	],
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #accessing }
AJx87MemoryStiInstruction class >> arity [
	^ 1 to: 1
]

{ #category : #accessing }
AJx87MemoryStiInstruction class >> group [
	^ #x87memSti
]

{ #category : #testing }
AJx87MemoryStiInstruction class >> isAbstract [
	^ self == AJx87MemoryStiInstruction
]

{ #category : #'code generation' }
AJx87MemoryStiInstruction >> emitX87Register: register [
	self
		emitByte: (self opCode2 bitAnd: 16rFF000000)>>24;
		emitByte: (self opCode2 bitAnd: 16r00FF0000)>>16 + register index.
]

{ #category : #accessing }
AJx87MemoryStiInstruction >> opCode2 [
	^ opCode2
]
