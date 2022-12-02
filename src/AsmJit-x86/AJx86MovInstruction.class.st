"
I am the general superclass for the x86 Mov instruction group for bit rotation.
"
Class {
	#name : #AJx86MovInstruction,
	#superclass : #AJx86SourceDestinationInstruction,
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #accessing }
AJx86MovInstruction class >> group [
	^ #mov
]

{ #category : #testing }
AJx86MovInstruction class >> isAbstract [
	^ self == AJx86MovInstruction
]

{ #category : #'instance creation' }
AJx86MovInstruction class >> source: anOperand destination: anDestinationOperand [
	^ self new
		source: anOperand;
		destination: anDestinationOperand
]

{ #category : #'code generation' }
AJx86MovInstruction >> emitMemory: dst immediate: src [
	| immediateSize |
	immediateSize := dst size <= 4
		ifTrue: [ dst size ]
		ifFalse: [ 4 ].
	self
		emitX86RM: 16rC6 + (dst size ~= 1) asBit
		size: dst size
		registerOrCode: 0
		rm: dst.
	^ self emitImmediate: src size: immediateSize
]

{ #category : #'code generation' }
AJx86MovInstruction >> emitMemory: dst register: src [
	self assert: src isRegisterGeneralPurposeByte | src isRegisterGeneralPurposeWord | src isRegisterGeneralPurposeDoubleword | src isRegisterGeneralPurposeQuadword.

	^ self
		emitX86RM: 16r88
		nonByteOffsetOperand: src
		size: src size
		registerOrCode: src
		rm: dst
]

{ #category : #'code generation' }
AJx86MovInstruction >> emitRegister: dst immediate: src [
	| immediateSize |
	immediateSize := dst size.
	(self is64BitMode & immediateSize) = 8 & src isInt32 & src isNoRelocation
		ifTrue: [
			"Optimize instruction size by using 32 bit immediate if value can fit to it"
			self
				emitX86RM: 16rC7
				size: dst size
				registerOrCode: 0
				rm: dst.
			immediateSize := 4 ]
		ifFalse: [
			self
				emitX86Inline:
					(immediateSize = 1
						ifTrue: [ 16rB0 ]
						ifFalse: [ 16rB8 ])
				reg: dst ].
	^ self emitImmediate: src size: immediateSize
]

{ #category : #'code generation' }
AJx86MovInstruction >> emitRegister: dst memory: src [
	(self is64BitMode and: [ src base notNil and: [ src base is64 not ]])
		ifTrue: [ Error signal: 'use a 64bit base register instead of ', src base asString, '(', (src base size * 8) asString, 'bit) for memory access on a 64bit CPU' ].
	^ self emitRegister: dst registerOrMemory: src
]

{ #category : #'code generation' }
AJx86MovInstruction >> emitRegister: destinationRegister register: sourceRegister [

	self assert: sourceRegister isRegisterGeneralPurposeByte | sourceRegister isRegisterGeneralPurposeWord | sourceRegister isRegisterGeneralPurposeDoubleword | sourceRegister isRegisterGeneralPurposeQuadword.

	destinationRegister assertSameSize: sourceRegister.

	^ self emitRegister: destinationRegister registerOrMemory: sourceRegister
]

{ #category : #'code generation' }
AJx86MovInstruction >> emitRegister: destinationRegister registerOrMemory: sourceOperand [

	self assert: destinationRegister isGeneralPurpose.
	"	(src size = dst size) ifFalse: [ self invalidInstruction ]. "

	^ self
		emitX86RM: 16r8A
		nonByteOffsetOperand: destinationRegister
		size: destinationRegister size
		registerOrCode: destinationRegister
		rm: sourceOperand
]
