"
Move Doubleword to Quadword with Sign-Extension
"
Class {
	#name : #AJx86MOVSXD,
	#superclass : #AJx86MovSignOrZeroExtendedInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86MOVSXD class >> description [
	^ #(#movsxd #movsxd 0 0 "R" 0 0 0 )
]

{ #category : #accessing }
AJx86MOVSXD class >> group [
	^ #movsxd
]

{ #category : #accessing }
AJx86MOVSXD class >> mnemonic [
	^ #movsxd
]

{ #category : #'code generation' }
AJx86MOVSXD >> emitRegister: destinationRegister register: sourceRegister [
	self
		assert: sourceRegister is32
		description: 'Expected 32bit register, but got', sourceRegister asString.

	^ super emitRegister: destinationRegister register: sourceRegister
]

{ #category : #'code generation' }
AJx86MOVSXD >> emitRegister: destinationRegister registerOrMemory: sourceRegisterOrMemory [
	self
		assert: self is64BitMode
		description: '64bit-only instruction'.

	self
		assert: destinationRegister is64
		description: 'Expected 64Bit destination, but got ', destinationRegister asString.

	self
		emitX86RM: 16r63
		size: destinationRegister size
		registerOrCode: destinationRegister
		rm: sourceRegisterOrMemory
]

{ #category : #accessing }
AJx86MOVSXD >> opCode1 [
	^ 16r0
]
