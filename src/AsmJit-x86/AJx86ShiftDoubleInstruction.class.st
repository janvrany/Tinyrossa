"
I am the general superclass for the x86 Shift-Double instruction group.
"
Class {
	#name : #AJx86ShiftDoubleInstruction,
	#superclass : #AJx86NewInstruction,
	#instVars : [
		'opCode1'
	],
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #accessing }
AJx86ShiftDoubleInstruction class >> arity [
	^ 3 to: 3
]

{ #category : #accessing }
AJx86ShiftDoubleInstruction class >> group [
	^ #shldShrd
]

{ #category : #testing }
AJx86ShiftDoubleInstruction class >> isAbstract [
	^ self == AJx86ShiftDoubleInstruction
]

{ #category : #'code generation' }
AJx86ShiftDoubleInstruction >> emitCode: asm [
	"force new code generation"
	self flag: 'Compatibility code'.
	description ifNotNil: [
		opCode1 := description opCode1.
		description := nil ].
	^ super emitCode: asm
]

{ #category : #'code generation' }
AJx86ShiftDoubleInstruction >> emitMemory: sourceMemory register: register immediate: immediate [

	immediate assertFitsInSize: 1.

	self
		emitRegisterOrMemory: sourceMemory
		register: register
		registerOrImmediate: immediate.

	immediate emitUsing: self size: 1.

]

{ #category : #'code generation' }
AJx86ShiftDoubleInstruction >> emitMemory: sourceMemory register: register register: shiftSizeRegister [

	^ self
		emitRegisterOrMemory: sourceMemory
		register: register
		register: shiftSizeRegister
]

{ #category : #'code generation' }
AJx86ShiftDoubleInstruction >> emitRegister: sourceRegister register: register immediate: immediate [

	sourceRegister assertSameSize: register.
	immediate assertFitsInSize: 1.

	self
		emitRegister: sourceRegister
		register: register
		registerOrImmediate: immediate.

	immediate emitUsing: self size: 1.

]

{ #category : #'code generation' }
AJx86ShiftDoubleInstruction >> emitRegister: sourceRegister register: register register: shiftSizeRegister [

	sourceRegister assertSameSize: register.

	^ self
		emitRegisterOrMemory: sourceRegister
		register: register
		register: shiftSizeRegister
]

{ #category : #'code generation' }
AJx86ShiftDoubleInstruction >> emitRegister: sourceRegister register: register registerOrImmediate: operand [

	sourceRegister assertSameSize: register.

	^ self
		emitRegisterOrMemory: sourceRegister
		register: register
		registerOrImmediate: operand
]

{ #category : #'code generation' }
AJx86ShiftDoubleInstruction >> emitRegisterOrMemory: sourceRegister register: register register: otherRegister [

	otherRegister assertCL.

	^ self
		emitRegisterOrMemory: sourceRegister
		register: register
		registerOrImmediate: otherRegister
]

{ #category : #'code generation' }
AJx86ShiftDoubleInstruction >> emitRegisterOrMemory: destinationOperand register: register registerOrImmediate: operand [

	register assertMinimumSize: 2.

	self
		emitX86RM: self opCode1 + operand isRegister asBit
		size: register size
		registerOrCode: register
		rm: destinationOperand
]

{ #category : #accessing }
AJx86ShiftDoubleInstruction >> opCode1 [
	^ opCode1
]
