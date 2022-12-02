"
Load Effective Address
"
Class {
	#name : #AJx86LEA,
	#superclass : #AJx86NewInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86LEA class >> arity [
	^ 2 to: 2
]

{ #category : #accessing }
AJx86LEA class >> description [
	^ #(#lea #lea 0 0 "R" 0 0 0 )
]

{ #category : #accessing }
AJx86LEA class >> group [
	^ #lea
]

{ #category : #accessing }
AJx86LEA class >> mnemonic [
	^ #lea
]

{ #category : #'code generation' }
AJx86LEA >> emitCode: asm [
	"force new code generation"
	self flag: 'Compatibility code'.
	description ifNotNil: [
		description := nil ].
	^ super emitCode: asm
]

{ #category : #'code generation' }
AJx86LEA >> emitRegister: register memory: memory [
	self
		emitX86RM: 16r8D
		size: register size
		registerOrCode: register
		rm: memory
]
