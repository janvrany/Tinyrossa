"
Byte Swap
"
Class {
	#name : #AJx86BSWAP,
	#superclass : #AJx86NewInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86BSWAP class >> arity [
	^ 1 to: 1
]

{ #category : #accessing }
AJx86BSWAP class >> description [
	^ #(#bswap #bswap 0 0 "R" 0 0 0 )
]

{ #category : #accessing }
AJx86BSWAP class >> group [
	^ #bswap
]

{ #category : #accessing }
AJx86BSWAP class >> mnemonic [
	^ #bswap
]

{ #category : #'code generation' }
AJx86BSWAP >> emitCode: asm [
	"force new code generation"
	self flag: 'Compatibility code'.
	description ifNotNil: [
		description := nil ].
	^ super emitCode: asm
]

{ #category : #'code generation' }
AJx86BSWAP >> emitRegister: register [
	register is16
		ifTrue: [ self emit16BitPrefix ].
	self emitRexForSingleOperand: register.
	self emitByte: 16r0F.
	register
		emitModRM: self code: 2r1
]
