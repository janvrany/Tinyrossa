"
CRC32 Cyclical Redundancy Check
"
Class {
	#name : #AJx86CRC32,
	#superclass : #AJx86NewInstruction,
	#instVars : [
		'source',
		'destination',
		'opCode1'
	],
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CRC32 class >> arity [
	^ 1 to: 1
]

{ #category : #accessing }
AJx86CRC32 class >> description [
	^ #(#crc32 #crc32 0 0 "R" 0 "C1" 16rF20F38F0 0 )
]

{ #category : #accessing }
AJx86CRC32 class >> group [
	^ #crc32
]

{ #category : #accessing }
AJx86CRC32 class >> mnemonic [
	^ #crc32
]

{ #category : #accessing }
AJx86CRC32 >> destination [
	^ destination
]

{ #category : #'code generation' }
AJx86CRC32 >> emitCode: asm [
	"force new code generation"
	self flag: 'Compatibility code'.
	description ifNotNil: [
		opCode1 := description opCode1.
		description := nil ].
	^ super emitCode: asm
]

{ #category : #'code generation' }
AJx86CRC32 >> emitRegister: register memory: memory [
	^ self emitRegister: register registerMemory: memory
]

{ #category : #'code generation' }
AJx86CRC32 >> emitRegister: register register: register2 [
	^ self emitRegister: register registerMemory: register2
]

{ #category : #'code generation' }
AJx86CRC32 >> emitRegister: register registerMemory: operand [
	self
		assert: (register isRegisterGeneralPurposeDoubleword | register isRegisterGeneralPurposeQuadword)
		description: 'Can only use general purpose 32 and 64bit registers as destination, but got ', register asString.

	self flag: 'TODO: hardcode the opcode: 16rF2 0F 38 F0'.

	^ self
		emitX86RM: self opCode1 + (operand size ~= 1) asBit
		size: operand size
		registerOrCode: register
		rm: operand
]

{ #category : #accessing }
AJx86CRC32 >> opCode1 [
	^ 16rF20F38F0
]

{ #category : #accessing }
AJx86CRC32 >> source [
	^ source
]
