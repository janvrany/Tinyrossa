"
I am an abstract superclass for the standard x86 registers.
"
Class {
	#name : #AJRegister,
	#superclass : #AJBaseReg,
	#category : #'AsmJit-Operands'
}

{ #category : #accessing }
AJRegister >> code: aCode [
	code := aCode.
	size :=  1 << (( code bitAnd: RegTypeMask ) >> 4).
]

{ #category : #'double dispatch' }
AJRegister >> emitOn: anInstruction [
	^ anInstruction emitRegister: self
]

{ #category : #'double dispatch' }
AJRegister >> emitOn: anInstruction immediate: anImmediateOperand [
	^ anInstruction emitImmediate: anImmediateOperand register: self
]

{ #category : #'double dispatch' }
AJRegister >> emitOn: anInstruction memory: aMemoryOperand [
	^ anInstruction emitMemory: aMemoryOperand register: self
]

{ #category : #'double dispatch' }
AJRegister >> emitOn: anObject memory: memory register: register [
	^ anObject emitMemory: memory register: register register: self
]

{ #category : #'double dispatch' }
AJRegister >> emitOn: anObject memory: memory with: operand [
	^ anObject emitMemory: memory register: self with: operand
]

{ #category : #'double dispatch' }
AJRegister >> emitOn: anInstruction register: aRegister [
	^ anInstruction emitRegister: aRegister register: self
]

{ #category : #'double dispatch' }
AJRegister >> emitOn: anObject register: register1 register: register2 [
	^ anObject emitRegister: register1 register: register2 register: self
]

{ #category : #'double dispatch' }
AJRegister >> emitOn: anObject register: aRegister with: anOperand [
	^ anObject emitRegister: aRegister register: self with: anOperand
]

{ #category : #'double dispatch' }
AJRegister >> emitOn: anInstruction with: anOperand [
	^ anInstruction emitRegister: self with: anOperand
]

{ #category : #'double dispatch' }
AJRegister >> emitOn: anObject with: anOperand1 with: anOperand2 [
	^ anObject emitRegister: self with: anOperand1 with: anOperand2
]

{ #category : #accessing }
AJRegister >> influencingRegisters [
	self is8
		ifFalse: [ ^ self as8 influencingRegisters ].
	^ { self as8. self as16. self as32. self as64}
]

{ #category : #testing }
AJRegister >> isGeneralPurpose [
	^ false
]

{ #category : #testing }
AJRegister >> isRegister [
	^ true
]

{ #category : #testing }
AJRegister >> isX86 [
	"Return whether this register is available in the standard x86 instruction set"

	^ self requiresRex not & (self index < 8)
]

{ #category : #accessing }
AJRegister >> size [
	^ 1 << (( code bitAnd: RegTypeMask ) >> 4).
]
