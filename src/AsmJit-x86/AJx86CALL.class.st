"
Procedure Call

Description
-----------
Saves procedure linking information on the stack and branches to the called procedure specified using the target operand. The target operand specifies the address of the first instruction in the called procedure. The operand can be an immediate value, a general-purpose register, or a memory location.

"
Class {
	#name : #AJx86CALL,
	#superclass : #AJx86StackInstruction,
	#instVars : [
		'target'
	],
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CALL class >> arity [
	^ 1 to: 1
]

{ #category : #accessing }
AJx86CALL class >> description [
	^ #(#call #call 0 0 "R" 0 0 0 )
]

{ #category : #accessing }
AJx86CALL class >> group [
	^ #call
]

{ #category : #accessing }
AJx86CALL class >> mnemonic [
	^ #call
]

{ #category : #'instance creation' }
AJx86CALL class >> target: anAddressSource [
	^ self new
		target: anAddressSource;
		yourself
]

{ #category : #'code generation' }
AJx86CALL >> basicEmitCode: asm [
	target := target asAJOperand.
	target
		emitOn: self
]

{ #category : #accessing }
AJx86CALL >> binarySize [
	self flag: 'TODO: delegate to label!'.
	^target isLabel ifTrue: [ ^5 ].
]

{ #category : #'code generation' }
AJx86CALL >> emitImmediate: immediate [
	self  emitByte: 16rE8.
	immediate emitUsing: self size: 4.
	^ self.
]

{ #category : #'code generation' }
AJx86CALL >> emitLabel: label [
	| distance |
	distance := label position - position - self binarySize.
	self
		emitByte: 16rE8;
		emitDoubleword: distance
]

{ #category : #'code generation' }
AJx86CALL >> emitMemory: memory [
	(self is64BitMode and: [ memory hasBase ])
		ifTrue: [
			(self tryEmit64BitShortcut: memory base: memory base)
				ifTrue: [ ^ self ]].

	self emitMemoryRegister:memory
]

{ #category : #'code generation' }
AJx86CALL >> emitMemoryRegister: memoryOrRegister [

	self
		emitX86RM: 16rFF
		size: 4
		registerOrCode: 2
		rm: memoryOrRegister
]

{ #category : #'code generation' }
AJx86CALL >> emitRegister: register [
	self is64BitMode
		ifTrue: [
			(self tryEmit64BitShortcut: register base: register)
				ifTrue: [ ^ self ].
			self
				assert: register is64
				description: 'Can only call 64 bit register in 64 bit mode, but got ', register name ]
		ifFalse: [
			self
				assert: register index = 0
				description: 'EAX is the only valid call register but got ', register name ].
	self emitMemoryRegister: register
]

{ #category : #accessing }
AJx86CALL >> operands [
	target notNil ifTrue: [^super operands, {target}].
	^super operands
]

{ #category : #accessing }
AJx86CALL >> operandsDo: aBlock [
	aBlock value: target
]

{ #category : #printing }
AJx86CALL >> printOperandsOn: aStream [
	aStream space; print: self target
]

{ #category : #'code generation' }
AJx86CALL >> reifyOperandsWith: anAJAssembler [
	super reifyOperandsWith: anAJAssembler.
	target ifNotNil: [
		target := self reifyOperand: target with: anAJAssembler ]

]

{ #category : #accessing }
AJx86CALL >> target [
	^ target
]

{ #category : #accessing }
AJx86CALL >> target: anObject [
	target := anObject
]

{ #category : #'code generation' }
AJx86CALL >> tryEmit64BitShortcut: memoryOrRegister base: register [

	(register is64 and: [ register isLowerBank ])
		ifFalse: [ ^ false ].


	self emitByte: 16rFF.
	memoryOrRegister emitModRM: self code: 2.
	^ true
]
