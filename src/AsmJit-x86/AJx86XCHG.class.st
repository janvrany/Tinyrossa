"
Exchange Register/Memory with Register
"
Class {
	#name : #AJx86XCHG,
	#superclass : #AJx86NewInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86XCHG class >> arity [
	^ 2 to: 2
]

{ #category : #accessing }
AJx86XCHG class >> description [
	^ #(#xchg #xchg 0 0 "R" 0 0 0 )
]

{ #category : #accessing }
AJx86XCHG class >> group [
	^ #xchg
]

{ #category : #accessing }
AJx86XCHG class >> mnemonic [
	^ #xchg
]

{ #category : #'code generation' }
AJx86XCHG >> emitCode: asm [
	"force new code generation"
	self flag: 'Compatibility code'.
	description ifNotNil: [
		description := nil ].
	^ super emitCode: asm
]

{ #category : #'code generation' }
AJx86XCHG >> emitMemory: destination register: register [
	^ self emitRegisterOrMemory: destination register: register
]

{ #category : #'code generation' }
AJx86XCHG >> emitRegister: destination memory: memory [
	^ self emitRegisterOrMemory: memory register: destination
]

{ #category : #'code generation' }
AJx86XCHG >> emitRegister: destinationRegister register: register [
	destinationRegister assertSameSize: register.

	(self tryEmitShortRegister: destinationRegister register: register)
		ifTrue: [ ^ self ].

	self emitRegisterOrMemory: destinationRegister register: register
]

{ #category : #'code generation' }
AJx86XCHG >> emitRegisterOrMemory: destinationOperand register: sourceRegister [

	self
		emitX86RM: 16r86
		nonByteOffsetOperand: sourceRegister
		size: sourceRegister size
		registerOrCode: sourceRegister
		rm: destinationOperand
]

{ #category : #'code generation' }
AJx86XCHG >> tryEmitShortRegister: destinationRegister register: sourceRegister [

	| index |

	"Special opcode for index 0 registers (AX, EAX, RAX vs register)"
	destinationRegister size = 1
		ifTrue: [ ^ false ].
	"one of the registers should be index = 0"
	(destinationRegister index = 0 or: [ sourceRegister index = 0 ])
		ifFalse: [ ^ false ].

	self
		emitRexForOp1: destinationRegister
		op2: sourceRegister.

	index := destinationRegister index + sourceRegister index.
	self emitByte: 16r90 + index.
	^ true

]
