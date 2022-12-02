"
I am a generic instruction class used for the transition to specific instruction classes in AsmJit
"
Class {
	#name : #AJx86NewInstruction,
	#superclass : #AJx86Instruction,
	#instVars : [
		'is64'
	],
	#classVars : [
		'mnemonicCache'
	],
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #accessing }
AJx86NewInstruction class >> arity [
	^ self subclassResponsibility
]

{ #category : #'instruction subclassing' }
AJx86NewInstruction class >> compileAccessorNamed: accessorName hexInt: integer [

	self
		compileAccessorNamed: accessorName
		valueString: '16r', (integer printStringBase: 16)
]

{ #category : #'instruction subclassing' }
AJx86NewInstruction class >> compileAccessorNamed: accessorName value: value [

	self
		compileAccessorNamed: accessorName
		valueString: value printString
]

{ #category : #'instruction subclassing' }
AJx86NewInstruction class >> compileAccessorNamed: accessorName valueString: aString [

	self
		compileAccessorNamed: accessorName
		valueString: aString
		in: self
]

{ #category : #'instruction subclassing' }
AJx86NewInstruction class >> compileAccessorNamed: accessorName valueString: aString in: aClass [

	aClass
		compile: (String streamContents: [ :s |
			s << accessorName; cr;
				tab; << '^ '; << aString
			])
		classified: 'accessing'

]

{ #category : #'instruction subclassing' }
AJx86NewInstruction class >> compileInstructionProperties: instructionDescription [
	self
		compileAccessorNamed: 'mnemonic'
		valueString: '#', instructionDescription name
		in: self class.

	self
		compileAccessorNamed: 'description'
		valueString: '#', instructionDescription asString
		in: self class.

	(self allInstVarNames includes: 'opCode')
		ifTrue: [ self
			compileAccessorNamed: 'opCode'
			hexInt: instructionDescription opCode1 ].

	#(opCode1 opCode2 opCodeR o1Flags o2Flags) do: [ :symbol |
		(self allInstVarNames includes: symbol)
			ifTrue: [ self
				compileAccessorNamed: symbol
				hexInt: (instructionDescription perform: symbol) ]].

	#(is32BitOnly is64BitOnly isDecrement) do: [ :symbol|
		(self allInstVarNames includes: symbol)
			ifTrue: [ self
				compileAccessorNamed: symbol
				value: (instructionDescription perform: symbol) ]].
]

{ #category : #accessing }
AJx86NewInstruction class >> forGroup: aGroupSymbol [
	self allSubclassesDo: [ :clazz |
		(clazz isAbstract not and: [ clazz group = aGroupSymbol ])
			ifTrue: [ ^ clazz ]].

	AJx86JumpInstruction group = aGroupSymbol
		ifTrue: [ ^ AJx86JumpInstruction ].

	KeyNotFound signalFor: aGroupSymbol
]

{ #category : #accessing }
AJx86NewInstruction class >> forMnemonic: aSymbol [
	self flag: 'TODO: Eventually this method will be gone, since we access instructions only by class name'.
	self mnemonicCache
		at: aSymbol
		ifPresent: [ :instruction | ^ instruction ].

	self allSubclassesDo: [ :clazz |
		(clazz isAbstract not and: [ clazz mnemonic = aSymbol ])
			ifTrue: [ ^ (self mnemonicCache at: aSymbol put: clazz) ]].

	AJx86JumpInstruction mnemonic = aSymbol
		ifTrue: [ ^ (self mnemonicCache at: aSymbol put: AJx86JumpInstruction) ].

	KeyNotFound signalFor: aSymbol
]

{ #category : #accessing }
AJx86NewInstruction class >> group [
	^ self subclassResponsibility
]

{ #category : #testing }
AJx86NewInstruction class >> isAbstract [
	^ self = AJx86NewInstruction
]

{ #category : #accessing }
AJx86NewInstruction class >> mnemonic [
	self subclassResponsibility
]

{ #category : #accessing }
AJx86NewInstruction class >> mnemonicCache [
	^ mnemonicCache ifNil: [ mnemonicCache := IdentityDictionary new ]
]

{ #category : #accessing }
AJx86NewInstruction class >> reset [
	mnemonicCache := nil
]

{ #category : #'instruction subclassing' }
AJx86NewInstruction class >> subclassInstructionDescription: instructionDescription [
	| instructionClass |
	instructionClass := self
		subclass: instructionDescription subclassName
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: self category, '-Concrete'.
	instructionClass compileInstructionProperties: instructionDescription.
]

{ #category : #accessing }
AJx86NewInstruction >> arity [
	^ self class arity
]

{ #category : #'code generation' }
AJx86NewInstruction >> basicEmitCode: asm [
	operands := operands collect: #asAJOperand.

	self flag: 'compatibility code'.

	operands size = 2
		ifTrue: [
			^ operands first
				emitOn: self
				with: operands second ].

	operands size = 1
		ifTrue: [
			^ operands first
				emitOn: self  ].

	operands ifEmpty: [ ^ self emit ].

	operands size = 3
		ifTrue: [
			^ operands first
				emitOn: self
				with: operands second
				with: operands third ].

	self shouldBeImplemented
]

{ #category : #'code generation' }
AJx86NewInstruction >> emitCode: asm [
	"do not generate machine code if it is already there"
	machineCode ifNotNil: [ ^ self ].

	self flag: 'migration code'.
	description ifNotNil: [ ^ super emitCode: asm ].

	machineCode := WriteStream on: (ByteArray new: 16).
	self basicEmitCode: asm.

	machineCode := machineCode contents.
]

{ #category : #'initialize-release' }
AJx86NewInstruction >> initialize [
	super initialize.
	is64 := false.
]

{ #category : #testing }
AJx86NewInstruction >> is32BitMode [
	^ self is64BitMode not
]

{ #category : #accessing }
AJx86NewInstruction >> is64 [
	^ is64
]

{ #category : #accessing }
AJx86NewInstruction >> is64: aBoolean [
	^ is64 := aBoolean
]

{ #category : #testing }
AJx86NewInstruction >> is64BitMode [
	^ self is64
]

{ #category : #accessing }
AJx86NewInstruction >> mnemonic [
	^ self class mnemonic
]

{ #category : #accessing }
AJx86NewInstruction >> name [
	^ self class mnemonic
]

{ #category : #'code generation' }
AJx86NewInstruction >> reifyOperandsWith: anAJAssembler [
	super reifyOperandsWith: anAJAssembler.
	self flag: 'Avoid super call here'.
	self operandsDo: [ :each | self reifyOperand: each with: anAJAssembler ]
]

{ #category : #testing }
AJx86NewInstruction >> requiresRex [
	"Answer true if I absolutely must have a REX prefix."

	self operandsDo: [ :rawOp |
		| operand |
		 operand := rawOp asAJOperand.
		(operand requiresRex or: [ operand is64 ])
			ifTrue: [ ^ true ]].
	^ false
]
