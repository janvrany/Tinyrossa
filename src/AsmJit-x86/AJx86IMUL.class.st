"
Signed Multiplication
"
Class {
	#name : #AJx86IMUL,
	#superclass : #AJx86NewInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86IMUL class >> arity [
	^ 1 to: 3
]

{ #category : #accessing }
AJx86IMUL class >> description [
	^ #(#imul #imul 0 0 "R" 0 0 0 )
]

{ #category : #accessing }
AJx86IMUL class >> group [
	^ #imul
]

{ #category : #accessing }
AJx86IMUL class >> mnemonic [
	^ #imul
]

{ #category : #'code generation' }
AJx86IMUL >> emitCode: asm [
	"force new code generation"
	self flag: 'Compatibility code'.
	description ifNotNil: [
		description := nil ].
	^ super emitCode: asm
]

{ #category : #'code generation' }
AJx86IMUL >> emitMemory: memory [
	^ self emitRegisterOrMemory: memory
]

{ #category : #'code generation' }
AJx86IMUL >> emitRegister: register [
	^ self emitRegisterOrMemory: register
]

{ #category : #'code generation' }
AJx86IMUL >> emitRegister: registerDestination immediate: immediate [

	^ self
		emitRegister: registerDestination
		registerOrMemory: registerDestination
		immediate: immediate
]

{ #category : #'code generation' }
AJx86IMUL >> emitRegister: registerDestination memory: memory [
	self
		emitRegister: registerDestination
		registerOrMemory: memory
]

{ #category : #'code generation' }
AJx86IMUL >> emitRegister: registerDestination memory: memory immediate: immediate [
	^ self
		emitRegister: registerDestination
		registerOrMemory: memory
		immediate: immediate
]

{ #category : #'code generation' }
AJx86IMUL >> emitRegister: registerDestination register: register [
	registerDestination assertSameSize: register.
	^ self emitRegister: registerDestination registerOrMemory: register
]

{ #category : #'code generation' }
AJx86IMUL >> emitRegister: registerDestination register: register immediate: immediate [
	^ self
		emitRegister: registerDestination
		registerOrMemory: register
		immediate: immediate
]

{ #category : #'code generation' }
AJx86IMUL >> emitRegister: registerDestination registerOrMemory: memoryOrMemory [
	self
		emitX86RM: 16r0FAF
		size: registerDestination size
		registerOrCode: registerDestination code
		rm:  memoryOrMemory
]

{ #category : #'code generation' }
AJx86IMUL >> emitRegister: registerDestination registerOrMemory: registerOrMemory immediate: immediate [

	| immediateSize |

	(immediate is8 and: [ immediate isNoRelocation ])
		ifTrue: [	immediateSize := 1 ]
		ifFalse: [
			immediateSize := registerDestination isRegisterGeneralPurposeWord
							ifTrue: [ 2 ]
							ifFalse: [ 4 ]].
	self
		emitX86RM: (immediateSize = 1 ifTrue: [ 16r6B ] ifFalse: [ 16r69 ])
		size: registerDestination size
		registerOrCode: registerDestination code
		rm: registerOrMemory.

	^ self emitImmediate: immediate size: immediateSize.
]

{ #category : #'code generation' }
AJx86IMUL >> emitRegisterOrMemory: anOperand [
	self
		emitX86RM: 16rF6 + (anOperand size ~= 1) asBit
		size: anOperand size
		registerOrCode: 5
		rm:  anOperand
]
