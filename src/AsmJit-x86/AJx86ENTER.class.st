"
Create Proceedure Stack Frame
"
Class {
	#name : #AJx86ENTER,
	#superclass : #AJx86StackInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86ENTER class >> arity [
	^ 2 to: 2
]

{ #category : #accessing }
AJx86ENTER class >> description [
	^ #(#enter #enter 0 0 "R" 0 "C1" 16r000000C8 0 )
]

{ #category : #accessing }
AJx86ENTER class >> group [
	^ #enter
]

{ #category : #accessing }
AJx86ENTER class >> mnemonic [
	^ #enter
]

{ #category : #'code generation' }
AJx86ENTER >> emitCode: asm [
	"force new code generation"
	self flag: 'Compatibility code'.
	description ifNotNil: [
		description := nil ].
	^ super emitCode: asm
]

{ #category : #'code generation' }
AJx86ENTER >> emitImmediate: stackFrameSize immediate: nestingLevel [

	self
		assert: stackFrameSize isInt16
		description: 'Stackframe size operand must fit in 16bit but got ', stackFrameSize asString.
	self
		assert: nestingLevel isInt8
		description: 'Stackframe nesting level operand must fit in 8bit but got ', nestingLevel asString.

	self
		emitByte: 16rC8;
		emitImmediate: stackFrameSize size: 2;
		emitImmediate: nestingLevel   size: 1.

]
