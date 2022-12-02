"
Return from Procedure
"
Class {
	#name : #AJx86RET,
	#superclass : #AJx86StackInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86RET class >> arity [
	^ 0 to: 1
]

{ #category : #accessing }
AJx86RET class >> description [
	^ #(#ret #ret 0 0 "R" 0 0 0 )
]

{ #category : #accessing }
AJx86RET class >> group [
	^ #ret
]

{ #category : #accessing }
AJx86RET class >> mnemonic [
	^ #ret
]

{ #category : #'code generation' }
AJx86RET >> emit [
	^ self emitByte: 16rC3
]

{ #category : #'code generation' }
AJx86RET >> emitCode: asm [
	"force new code generation"
	self flag: 'Compatibility code'.
	description ifNotNil: [
		description := nil ].
	^ super emitCode: asm
]

{ #category : #'code generation' }
AJx86RET >> emitImmediate: immediate [
	self
		assert: (immediate isUnsigned and: [immediate fitsInSize: 2])
		description: 'Expected unsigned 16bit immediate, but got ', immediate asString.

	(immediate value = 0 and: [ immediate isNoRelocation ])
		ifTrue: [ ^ self emitByte: 16rC3	].

	self
		emitByte: 16rC2;
		emitImmediate: immediate size: 2
]
