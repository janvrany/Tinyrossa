Class {
	#name : #AcRISCVCall,
	#superclass : #AcInstruction,
	#instVars : [
		'auipc',
		'jalr'
	],
	#category : #'Tinyrossa-RISCV-ArchC'
}

{ #category : #'instance creation' }
AcRISCVCall class >> new [
	^ self basicNew initialize.
]

{ #category : #accessing }
AcRISCVCall >> assembleDSL: mnemonic operands: operandList [
	| reg offset env |

	self assert: mnemonic = 'call'.

	operandList size == 2 ifTrue: [ 
		reg := operandList first value.
		offset := operandList second toBitVector: 32.
	] ifFalse: [ 
		reg := 1. "ra"
		offset := operandList first toBitVector: 32.
	].

	env := SmallDictionary new.
	env at: 'rd' put: reg.
	env at: 'imm' put: (offset copyFrom: 31 to: 12).
	auipc := (AcProcessorDescriptions riscv64 instructionAt: 'auipc') inEnvironment: env.

	env at: 'rs1' put: reg.
	env at: 'imm' put: (offset copyFrom: 11 to: 0).
	jalr := (AcProcessorDescriptions riscv64 instructionAt: 'jalr') inEnvironment: env.
]

{ #category : #'accessing-private' }
AcRISCVCall >> auipc: auipcInsn jalr: jalrInsn [
	auipc := auipcInsn.
	jalr := jalrInsn.
]

{ #category : #accessing }
AcRISCVCall >> binaryEncoding [
	^ auipc binaryEncoding , jalr binaryEncoding
]

{ #category : #accessing }
AcRISCVCall >> bitWidth [
	^ auipc bitWidth + jalr bitWidth
]

{ #category : #'encoding / decoding' }
AcRISCVCall >> decodeBits: aBitVector [
	^ self shouldNotImplement
]

{ #category : #'encoding / decoding' }
AcRISCVCall >> disassemble [
	^ String streamContents: [ :out|
		| reg imm |

		out nextPutAll: 'call '.

		reg := auipc fieldValue: 'rd'.
		reg isInteger not ifTrue: [ 
			| variables |

			variables := reg variableNames.
			out nextPut: ${.
			variables size == 1 ifTrue: [ 
				out nextPutAll: variables anyOne.
			] ifFalse: [ 
				out nextPutAll: reg astToString.
			].
			out nextPutAll: '}, '.
		] ifFalse: [
			reg ~~ 1 ifTrue: [ 
				reg := (AcProcessorDescriptions riscv64 maps at: 'gpr') backLookup: reg value ifAbsent: [ '??' ].
				out nextPutAll: reg; nextPutAll: ', '.
			].
		].
		imm := ((auipc fieldValue: 'imm') , (jalr fieldValue: 'imm')) simplify.
		imm isSymbolic ifTrue: [
			| variables |

			variables := imm variableNames.
			variables size == 1 ifTrue: [ 
				"If the variable name is valid (GNU) assembler label name,
				 output it without braces. See AcAsmFormatBuiltinChunk >> #assembler."
				| name |

				name := variables anyOne.
				((name allSatisfy:[:c | c isAlphaNumeric or:['_.$@' includes:c]]) and: [ name first isDigit not ]) ifTrue: [ 
					"Valid (GNU) assembler symbol"
					out nextPutAll: name.
				] ifFalse: [ 
					"Anything else"
					out
						nextPut: ${;
						nextPutAll: name;
						nextPut: $}.
				].
			] ifFalse: [ 
				"Function of multiple variables, print the whole AST"
				out
						nextPut: ${;
						nextPutAll: imm astToString;
						nextPut: $}.
			].
		] ifFalse: [
			imm := imm signedValue.    
			imm positive ifTrue: [ 
				out nextPutAll: '.+0x'.
			] ifFalse: [ 
				out nextPutAll: '.-0x'.
			].
			imm abs
				printOn: out
				base: 16
				showRadix: false
		].      
	].
]

{ #category : #'encoding / decoding' }
AcRISCVCall >> emitOn: aStream [
	"Emit (encode) instruction on given (binary) stream. The instruction
	 must be fully grounded (that is: not symbolic) otherwise an error is
	 thrown.
	"
	auipc emitOn: aStream.
	jalr emitOn: aStream.
]

{ #category : #accessing }
AcRISCVCall >> externalBindings [ 
	^ auipc externalBindings , jalr externalBindings
]

{ #category : #accessing }
AcRISCVCall >> format [
	^ self shouldNotImplement
]

{ #category : #converting }
AcRISCVCall >> inEnvironment: env [
	^ self class basicNew
		auipc: (auipc inEnvironment: env)
		jalr: (jalr inEnvironment: env)
]

{ #category : #initialization }
AcRISCVCall >> initialize [
	| env |

	super initialize.
	env := SmallDictionary new.
	env at: 'rs1' put: 'rd'.
	auipc := (AcProcessorDescriptions riscv64 instructionAt: 'auipc') inEnvironment: env.
	jalr := (AcProcessorDescriptions riscv64 instructionAt: 'jalr') inEnvironment: env.         

	"
	AcRISCVCall new
	"
]

{ #category : #testing }
AcRISCVCall >> isProcessorInstruction [
	^ true
]

{ #category : #accessing }
AcRISCVCall >> name [
	^ 'call'
]

{ #category : #printing }
AcRISCVCall >> printOn: aStream [ 
	aStream nextPutAll: (self name); nextPutAll: ': '.
	aStream nextPutAll: self disassemble.
]
