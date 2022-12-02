"
I am a specialized subclass for x86-64
"
Class {
	#name : #AJx64InstructionDescription,
	#superclass : #AJx86InstructionDescription,
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #'code emitting' }
AJx64InstructionDescription >> emitalu: emitter operand1: op1 operand2: op2 operand3: op3 [
	| opCode opReg |
	opCode := opCode1.
	opReg := opCodeR.

	" Mem <- Reg "
	(op1 isMemory and: [ op2 isRegister ])
		ifTrue: [
			^ emitter
				emitX86RM: opCode + op2 isRegisterGeneralPurposeByte not asBit
				size: op2 size
				registerOrCode: op2
				rm: op1 ].
	"Reg <- Reg|Mem"
	(op1 isRegister and: [ op2 isRegisterOrMemory ])
		ifTrue: [
			(op2 isRegister and: [ op1 size ~= op2 size ])
				ifTrue: [ self invalidInstruction ].
			^ emitter
				emitX86RM: opCode + 2 + op1 isRegisterGeneralPurposeByte not asBit
				size: op1 size
				registerOrCode: op1
				rm: op2 ].
	op2 isImmediate
		ifFalse: [ self invalidInstruction ].
	" AL, AX, EAX, RAX register shortcuts"
	(op1 isRegIndex: 0)
		ifTrue: [
			op1 is16
				ifTrue: [ emitter emitByte: 16r66	" 16 bit " ].
			op1 is64
				ifTrue: [ emitter emitByte: 16r48	" REX.W" ].
			emitter emitByte: (opReg << 3 bitOr: 16r04 + op1 isRegisterGeneralPurposeByte not asBit).
			^ emitter emitImmediate: op2 size: (op1 size min: 4) ].
	"short constant"
	op2 isInt8
		ifTrue: [
			| szBits |
			szBits := op1 size = 1
				ifTrue: [ 0 ]
				ifFalse: [ 3 ].
			emitter
				emitX86RM: opCode2 + szBits
				size: op1 size
				registerOrCode: opReg
				rm: op1
				immediateSize: 1.
			^ emitter emitImmediate: op2 size: 1 ].
	op1 isRegisterOrMemory
		ifTrue: [
			| immSize szBits |
			immSize := op2 isInt8
				ifTrue: [ 1 ]
				ifFalse: [ op1 size min: 4 ].
			szBits := op1 size ~= 1
				ifTrue: [
					immSize ~= 1
						ifTrue: [ 1 ]
						ifFalse: [ 3 ] ]
				ifFalse: [ 0 ].
			emitter
				emitX86RM: opCode2 + szBits
				size: op1 size
				registerOrCode: opReg
				rm: op1
				immediateSize: immSize.
			^ emitter emitImmediate: op2 size: immSize ].
	self invalidInstruction
]

{ #category : #'code emitting' }
AJx64InstructionDescription >> emitbswap: emitter operand1: op1 operand2: op2 operand3: op3 [

	op1 isRegister ifTrue: [
		emitter emitRexForSingleOperand: op1.
		emitter emitByte: 16r0F.
		^ emitter emitModR: 1 r: op1 code
	].
	self invalidInstruction.
]

{ #category : #'code emitting' }
AJx64InstructionDescription >> emitcall: emitter operand1: op1 operand2: op2 operand3: op3 [

	(op1 isRegister and: [ op1 is64 and: [ op1 isUpperBank not ]]) ifTrue: [
		"shortcut"
		emitter emitByte: 16rFF.
		op1 emitModRM: emitter code: 2.
		^ self].

	(op1 isMemory and: [op1 hasBase and: [ op1 base is64 and: [ op1 base isUpperBank not ]]]) ifTrue: [
		"shortcut"
		emitter emitByte: 16rFF.
		op1 emitModRM: emitter code: 2.
		^ self].

	(op1 isMemory or: [ op1 isRegister and: [ op1 is64 ] ]) ifTrue: [
		^ emitter emitX86RM:  16rFF
			size: 4
			registerOrCode: 2
			rm: op1
	].

	op1 isImmediate ifTrue: [ "call by relative offset, you should be really sure what you're' doing"
		emitter emitByte: 16rE8.
		op1 emitUsing: emitter size: 4.
		^ self.
		].

	op1 isLabel ifTrue: [
		emitter emitByte: 16rE8.
		emitter emitDisplacement: op1 inlinedDisp: -4.
		^ self
	].
	self invalidInstruction.

]

{ #category : #'code emitting' }
AJx64InstructionDescription >> emitmov: emitter operand1: dst operand2: src operand3: op3 [

	src isRegister & dst isRegister ifTrue: [
		self assert: (src isRegisterGeneralPurposeByte | src isRegisterGeneralPurposeWord | src isRegisterGeneralPurposeDoubleword | src isRegisterGeneralPurposeQuadword ).
		].

	" reg <- mem "
	dst isRegister & src isRegisterOrMemory ifTrue: [
		self assert: (dst isRegisterGeneralPurposeByte | dst isRegisterGeneralPurposeWord | dst isRegisterGeneralPurposeDoubleword | dst isRegisterGeneralPurposeQuadword ).
		src isMemory
			ifTrue: [ (src base notNil and: [ src base is64 not ])
				ifTrue: [ Error signal: 'use a 64bit base register instead of ', src base asString, '(', (src base size * 8) asString, 'bit) for memory access on a 64bit CPU' ]]
			ifFalse:[ (src size = dst size)
				ifFalse: [ Error signal: 'source ',src asString,' and destination ',dst asString,' need to have the same size' ]].
		^ emitter emitX86RM: 16r0000008A + dst isRegisterGeneralPurposeByte not asBit
			size:  dst size
			registerOrCode:  dst
			rm: src
		].

	" reg <- imm "
	dst isRegister & src isImmediate ifTrue: [
		| immSize |
		immSize := dst size.
		"Optimize instruction size by using 32 bit immediate if value can fit to it"
		emitter is64BitMode & immSize = 8 & src isInt32 & src isNoRelocation ifTrue: [
			 emitter emitX86RM: 16rC7
				size: dst size
				registerOrCode: 0 rm: dst.
	        immSize := 4
		] ifFalse: [
			emitter emitX86Inline: (immSize=1 ifTrue: [16rB0] ifFalse: [16rB8]) reg: dst.
		].
		^ emitter emitImmediate: src size: immSize
	].

	"mem <- reg"
	dst isMemory & src isRegister ifTrue: [
		self assert: (src isRegisterGeneralPurposeByte | src isRegisterGeneralPurposeWord | src isRegisterGeneralPurposeDoubleword | src isRegisterGeneralPurposeQuadword ).
		^ emitter emitX86RM: 16r88 + src isRegisterGeneralPurposeByte not asBit
			size: src size registerOrCode: src rm: dst
	].

	"mem <- imm"
	dst isMemory & src isImmediate ifTrue: [ | immSize |

		immSize := dst size <= 4 ifTrue: [ dst size ] ifFalse: [4].

		emitter emitX86RM: 16rC6 + ((dst size = 1) not) asBit
			size: dst size
			registerOrCode:  0 rm:  dst
			immediateSize: immSize.

		^ emitter emitImmediate: src size: immSize
	].

	self invalidInstruction

]

{ #category : #'code emitting' }
AJx64InstructionDescription >> emitmovSxZx: emitter operand1: dst operand2: src operand3: op3 [
	dst isRegister & src isRegisterOrMemory
		ifFalse: [ self invalidInstruction ].
	src size >= dst size
		ifTrue: [ self invalidInstruction ].
	dst isGeneralPurpose
		ifFalse: [ self invalidInstruction ].
	src is16
		ifTrue: [
			^ emitter
				emitX86RM: opCode1 + 1
				size: dst size
				registerOrCode: dst
				rm: src ].
	src is32
		ifTrue: [ self invalidInstruction ].	"64 bit source"
	emitter
		emitX86RM: opCode1
		size: dst size
		registerOrCode: dst
		rm: src
]

{ #category : #'code emitting' }
AJx64InstructionDescription >> emitpop: emitter operand1: op1 operand2: op2 operand3: op3 [
	op1 isRegister ifTrue: [
		self assert: op1 isGeneralPurpose.
		(op1 is32 or: [ op1 is8 ])
			ifTrue: [ Error signal: 'invalid register ', op1 name, '. push/pop requires 64bit/16bit reg in 64bit mode'].
		^ emitter emitX86Inline: opCode1 register: op1 withRex: op1 isUpperBank.
		].

	op1 isMemory ifFalse: [ self invalidInstruction ].
	emitter emitX86RM: opCode2 size: op1 size registerOrCode: opCodeR rm: op1

]
