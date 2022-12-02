"
I am the generic/abstract superclass for all x86 Instructions.
"
Class {
	#name : #AJx86Instruction,
	#superclass : #AJInstruction,
	#instVars : [
		'description'
	],
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #visitor }
AJx86Instruction >> accept: anObject [
	"generic instruction"
	^ anObject visitInstruction: self

]

{ #category : #validation }
AJx86Instruction >> checkOperandsForConflict [
	"Signal an error if the given operands cannot be used together. Must be sent after operands are set."

	| prohibited required |
	self is32BitMode
		ifTrue: [ ^ self ].
	required := self requiresRex.
	prohibited := false.
	self operandsDo: [ :op |
		(op isInteger not and: [ op prohibitsRex ])
			ifTrue: [ prohibited := true ]].
	prohibited & required
		ifTrue: [ self error: 'Mix of operands that require and prohibit a REX prefix' ]
]

{ #category : #accessing }
AJx86Instruction >> description [
	^ description
]

{ #category : #accessing }
AJx86Instruction >> description: anInstructionDescription [
	description := anInstructionDescription
]

{ #category : #'code generation' }
AJx86Instruction >> emit16BitPrefix [
	^ self emitByte: 16r66
]

{ #category : #'code generation' }
AJx86Instruction >> emit64BitRexPrefix [
	^ self emitByte: 2r01001000
]

{ #category : #'code generation' }
AJx86Instruction >> emitByte: byte [

	self assert: byte isByte.
	machineCode nextPut: byte

]

{ #category : #'code generation' }
AJx86Instruction >> emitCode: asm [
	"do not generate machine code if it is already there"
	machineCode ifNotNil: [ ^ self ].

	"make sure all operands are converted"
	operands ifNotNil: [ operands := operands collect: #asAJOperand ].

	machineCode := WriteStream on: (ByteArray new: 16).
	description emitUsing: self operands: operands.

	machineCode := machineCode contents.
]

{ #category : #'code generation' }
AJx86Instruction >> emitDoubleword: dword [

	"Emit dword (4 bytes) in little-endian order (since our target it x86 anyways)"

	self
		emitByte: (dword bitAnd: 255);
		emitByte: (dword>>8 bitAnd: 255);

		emitByte: (dword>>16 bitAnd: 255);
		emitByte: (dword>>24 bitAnd: 255)


]

{ #category : #'code generation' }
AJx86Instruction >> emitImmediate: imm size: size [

	^ imm emitUsing: self size: size
]

{ #category : #'code generation' }
AJx86Instruction >> emitMod: mod reg: reg rm: rm [
	"Emit MODR/M byte.
	mmrrrxxx

	mm = mod
	rrr = REG (r8/r16/r32/mm/xmm
	xxx = r/m
	"

	^ self emitByte: (mod & 3) << 3 + (reg & 7) << 3 + (rm & 7)

]

{ #category : #'code generation' }
AJx86Instruction >> emitOpCode: opCode [
	| byte |
	"instruction prefix"
	(byte := (opCode bitAnd: 16rFF000000)) = 0 ifFalse: [
		self emitByte: byte >> 24 ].
	(byte := (opCode bitAnd: 16r00FF0000)) = 0 ifFalse: [
		self emitByte: byte >> 16 ].
	(byte := (opCode bitAnd: 16r0000FF00)) = 0 ifFalse: [
		self emitByte: byte >> 8 ].
	self emitByte: (opCode bitAnd: 16rFF).

]

{ #category : #'code generation - prefixes' }
AJx86Instruction >> emitOperandSizeOverridePrefix: anOperand [
	"If creating 64bit code, this must be called last of the prefix-generators, as the 64-bit prefixes are required to precede the opcode"

	"Switch to 16-bit operand mode for the next opcode if necessary"
	anOperand is16 ifTrue: [ self emit16BitPrefix ].
	self emitRexRM: anOperand is64 registerCode: 0 rm: anOperand



]

{ #category : #'code generation' }
AJx86Instruction >> emitQuadword: quadwordInteger [

	"Emit a qword (8 bytes) in little-endian order (since our target it x86 anyways)"

	self
		emitByte: (quadwordInteger bitAnd: 255);
		emitByte: (quadwordInteger>>8 bitAnd: 255);

		emitByte: (quadwordInteger>>16 bitAnd: 255);
		emitByte: (quadwordInteger>>24 bitAnd: 255);

		emitByte: (quadwordInteger>>32 bitAnd: 255);
		emitByte: (quadwordInteger>>40 bitAnd: 255);

		emitByte: (quadwordInteger>>48 bitAnd: 255);
		emitByte: (quadwordInteger>>56 bitAnd: 255)


]

{ #category : #'code generation' }
AJx86Instruction >> emitRexForInteger: anInt op2: op2 [

	self emitRexPrefixW: op2 is64 R: false X: false  B:  op2 isUpperBank.
]

{ #category : #'code generation' }
AJx86Instruction >> emitRexForOp1: op1 op2: op2 [
	"op1 is the general-purpose register argument (or a register number).
	op2 is the reg/mem argument.

	In 64-bit mode, the instruction's default operation size is 32 bits.
	Use of the REX.W prefix promotes operation to 64 bits.
	Use of the REX.R prefix permits access to additional registers (R8-R15) for the op1 (reg) register.
	Use of the REX.B prefix permits access to additional registers (R8-R15) for the op2 (r/m) register, or the base register of op2 if register indirect.
	Use of the REX.X prefix permits access to additional registers (R8-R15) for the index register of op2, if indexed.
	See the summary chart at the beginning of this section for encoding data and limits."

	| requires64Bit |
	"no-op in 32 bit mode"
	self is32BitMode
		ifTrue: [ ^ self ].
	op1 isInteger
		ifTrue: [ ^ self emitRexForInteger: op1 op2: op2 ].
	requires64Bit := op1 is64 or: [ op2 isRegister and: [ op2 is64 ] ].
	self
		emitRexPrefixW: requires64Bit
		R: op1 isUpperBank
		X: op2 hasUpperBankIndex
		B: op2 isUpperBank
]

{ #category : #'code generation' }
AJx86Instruction >> emitRexForSingleOperand: op [
	"In 64-bit mode, the instruction’s default operation size is 32 bits.
	Use of the REX.W prefix promotes operation to 64 bits.
	Use of the REX.B prefix permits access to additional registers (R8-R15).
	See the summary chart at the beginning of this section for encoding data and limits."

	self emitRexPrefixW: op is64 R: false X: false B: op isUpperBank .
]

{ #category : #'code generation' }
AJx86Instruction >> emitRexPrefixW: w R: r X: x B: b [
	"
	field  bit   def
	-      7-4   2r0100 REX prefix identifier
	W      3     0 = Operand size determined by CS.D
	             1 = 64 Bit Operand Size
	R      2     Extension of the ModR/M reg field
	X      1     Extension of the SIB index field
	B      0     Extension of the ModR/M r/m field. SIB base field, or Opcode reg field
	"

	self requiresRex
		ifTrue: [
			self is32BitMode
				ifTrue: [ self error: 'Attempt to use a 64-bit-specific instruction or operand in 32-bit mode' ]
				ifFalse: [ self emitByte: 2r0100 << 4 | (w asBit << 3) | (r asBit << 2) | (x asBit << 1) | b asBit ] ]
]

{ #category : #'code generation' }
AJx86Instruction >> emitRexR: w opReg: opReg registerCode: regCode [
	"no-op in 32 bit mode"


]

{ #category : #'code generation' }
AJx86Instruction >> emitRexRM: opRequires64Bit registerCode: regCode rm: rm [

	self emitRexPrefixW: opRequires64Bit R: (regCode > 7) X: false B: rm isUpperBank


]

{ #category : #'code generation' }
AJx86Instruction >> emitScale: scaleExponent index: indexCode base: baseCode [
	"Emit the SIB byte for address manipulation"
	self emitByte: (scaleExponent << 6) + ((indexCode bitAnd: 2r111) << 3) + (baseCode bitAnd: 7)
]

{ #category : #'code generation' }
AJx86Instruction >> emitSegmentPrefix: aMem [

	(aMem isMemory and: [ aMem hasSegmentPrefix ]) ifTrue: [
		self emitByte: aMem segmentPrefixCode.
	]

]

{ #category : #'emitting code' }
AJx86Instruction >> emitWord: aWord [

	"little-endian"

	self
		emitByte: (aWord bitAnd: 255);
		emitByte: ((aWord >> 8) bitAnd: 255)

]

{ #category : #'code generation' }
AJx86Instruction >> emitX86Inline: opCode reg: reg [
	"Emit instruction where register is inlined to opcode."

	^ self emitX86Inline: opCode register: reg withRex: true
]

{ #category : #'code generation' }
AJx86Instruction >> emitX86Inline: opCode register: reg withRex: useREX [
	"Emit instruction where register is inlined to opcode."

	| byte |
	"16 bit prefix"
	reg is16
		ifTrue: [ self emit16BitPrefix ].

	"instruction prefix"
	(byte := (opCode bitAnd: 16rFF000000)) = 0 ifFalse: [
		self emitByte: byte >> 24 ].

	useREX ifTrue: [ self emitRexForSingleOperand: reg ].

	(byte := (opCode bitAnd: 16r00FF0000)) = 0 ifFalse: [
		self emitByte: byte >> 16 ].

	(byte := (opCode bitAnd: 16r0000FF00)) = 0 ifFalse: [
		self emitByte: byte >> 8 ].

	self emitByte: (opCode bitAnd: 16rFF) + (reg code bitAnd: 7).

]

{ #category : #'code generation' }
AJx86Instruction >> emitX86RM: opCode nonByteOffsetOperand: operand size: aSize registerOrCode: regOrCode rm: regOrMem [
	^ self
		emitX86RM: opCode + operand isRegisterGeneralPurposeByte not asBit
		size: aSize
		registerOrCode:
		regOrCode
		rm: regOrMem
]

{ #category : #'code generation' }
AJx86Instruction >> emitX86RM: opCode size: aSize registerOrCode: regOrCode rm: regOrMem [
"Emit instruction with reg/memory operand."

	| byte code |
	code := regOrCode isInteger
				ifTrue: [ regOrCode ]
				ifFalse: [ regOrCode code ].

	"16 bit prefix"
	aSize == 2
		ifTrue: [ self emit16BitPrefix ].

	"segment prefix"
	self emitSegmentPrefix: regOrMem.
	"instruction prefix"
	(byte := (opCode bitAnd: 16rFF000000)) = 0
		ifFalse: [ self emitByte: byte >> 24 ].

	self emitRexForOp1: regOrCode op2: regOrMem.

	(byte := (opCode bitAnd: 16r00FF0000)) = 0
		ifFalse: [ self emitByte: byte >> 16 ].

	(byte := (opCode bitAnd: 16r0000FF00)) = 0
		ifFalse: [ self emitByte: byte >> 8 ].

	self emitByte: (opCode bitAnd: 16rFF).

	"ModR/M"
	^ regOrMem
		emitModRM: self
		code: code

]

{ #category : #'code generation' }
AJx86Instruction >> emitX86RM: opCode size: aSize registerOrCode: regOrCode rm: regOrMem immediateSize: immSize [
	^ self emitX86RM: opCode size: aSize registerOrCode: regOrCode rm: regOrMem
]

{ #category : #accessing }
AJx86Instruction >> instructionDescriptions [
	^ AJx86InstructionDescription instructions
]

{ #category : #testing }
AJx86Instruction >> is32BitMode [

	^ true
]

{ #category : #testing }
AJx86Instruction >> is64BitMode [
	^ false
]

{ #category : #testing }
AJx86Instruction >> isGPNRegister: reg [

	"answer true if given register is native general purpose register,
	matching the target native size i.e. 32 bits for x86 or 64 bits for x64"
	^ reg isGeneralPurpose and: [ reg size = 4 ]
]

{ #category : #testing }
AJx86Instruction >> isRegisterGeneralPurposeNative: reg [

	"answer true if given register is native general purpose register,
	matching the target native size i.e. 32 bits for x86 or 64 bits for x64"
	reg isGeneralPurpose
		ifFalse: [ ^ false ].

	(self is32BitMode and: [ reg is32 ])
		ifTrue: [ ^ true ].

	^ (self is64BitMode and: [ reg is64 ])
]

{ #category : #accessing }
AJx86Instruction >> positionAtTheMoment [
	"Valid only during code emission"
	^ self position + machineCode position
]

{ #category : #testing }
AJx86Instruction >> requiresRex [
	^false
]

{ #category : #'code generation' }
AJx86Instruction >> setLabelPosition: label [
	"set label position for immediate operand(s), if any"
	label position: self position + machineCode size.
]

{ #category : #validation }
AJx86Instruction >> validate [
	^ self checkOperandsForConflict
]
