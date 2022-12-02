"
Logical Compare
"
Class {
	#name : #AJx86TEST,
	#superclass : #AJx86NewInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86TEST class >> arity [
	^ 2 to: 2
]

{ #category : #accessing }
AJx86TEST class >> description [
	^ #(#test #test 0 0 "R" 0 0 0 )
]

{ #category : #accessing }
AJx86TEST class >> group [
	^ #test
]

{ #category : #accessing }
AJx86TEST class >> mnemonic [
	^ #test
]

{ #category : #'code generation' }
AJx86TEST >> emitCode: asm [
	"force new code generation"
	self flag: 'Compatibility code'.
	description ifNotNil: [
		description := nil ].
	^ super emitCode: asm
]

{ #category : #'code generation' }
AJx86TEST >> emitMemory: leftMemory immediate: rightImmediate [
	| immediateSize |

	rightImmediate assertFitsInSize: 8.
	immediateSize := rightImmediate smallestOperandSize.

	self
		emitRegisterOrMemory: leftMemory
		immediate: rightImmediate
		size: immediateSize
]

{ #category : #'code generation' }
AJx86TEST >> emitMemory: leftMemory register: rightRegister [
	^ self emitRegisterOrMemory: leftMemory register: rightRegister
]

{ #category : #'code generation' }
AJx86TEST >> emitRegister: leftRegister immediate: rightImmediate [
	| immediateSize |

	rightImmediate assertFitsIn: leftRegister.

	(self emitShortRegister: leftRegister immediate: rightImmediate)
		ifTrue: [ ^ self ].

	immediateSize := leftRegister size min: 4.

	self
		emitRegisterOrMemory: leftRegister
		immediate: rightImmediate
		size: immediateSize
]

{ #category : #'code generation' }
AJx86TEST >> emitRegister: leftRegister register: rightRegister [
	leftRegister assertSameSize: rightRegister.
	^ self emitRegisterOrMemory: leftRegister register: rightRegister
]

{ #category : #'code generation helper' }
AJx86TEST >> emitRegisterOrMemory: leftRegister immediate: rightImmediate size: immediateSize [

	self
		emitX86RM: 16rF6
		nonByteOffsetOperand: leftRegister
		size: immediateSize
		registerOrCode: self opCodeR
		rm: leftRegister.

	self emitImmediate: rightImmediate size: immediateSize
]

{ #category : #'code generation helper' }
AJx86TEST >> emitRegisterOrMemory: leftOperand register: rightRegister [
	self
		emitX86RM: 16r84
		nonByteOffsetOperand: rightRegister
		size: rightRegister size
		registerOrCode: rightRegister
		rm: leftOperand
]

{ #category : #'code generation helper' }
AJx86TEST >> emitShortRegister: leftRegister immediate: rightImmediate [
	| immediateSize |
	leftRegister index = 0
		ifFalse: [ ^ false ].

	immediateSize := leftRegister size min: 4.
	leftRegister is16
		ifTrue: [ self emit16BitPrefix ].

	self
		emitRexRM: leftRegister is64 registerCode: self opCodeR rm: leftRegister;
		emitByte: 16rA8 + (leftRegister size ~= 1) asBit;
		emitImmediate: rightImmediate size: immediateSize.

	^ true
]

{ #category : #accessing }
AJx86TEST >> opCodeR [
	^ 0
]
