"
JUMP instruction for the x86 instruction set.
"
Class {
	#name : #AJx86JumpInstruction,
	#superclass : #AJJumpInstruction,
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #accessing }
AJx86JumpInstruction class >> group [
	^ #jmp
]

{ #category : #accessing }
AJx86JumpInstruction class >> mnemonic [
	^ #jmp
]

{ #category : #'instruction subclassing' }
AJx86JumpInstruction class >> subclassInstructionDescription: description [
	"cannot be done here"
]

{ #category : #accessing }
AJx86JumpInstruction >> codeSize [
	machineCode ifNil: [  ^ 2 ].
	^ machineCode size
]

{ #category : #'code generation' }
AJx86JumpInstruction >> emitCode: asm [
	"generate opcodes"

	| delta code nextInstruction target desc |

	target := label position.
	target ifNil: [ ^ machineCode := nil ].

	nextInstruction := position + 2.
	delta := (target - nextInstruction) asImm.
	desc := self instructionDescriptions at: name.	"can we use 8bit offset?"
	machineCode := delta isInt8
		ifTrue: [ 	self emitShortJump: desc offset: delta ]
		ifFalse: [ self emitLongJump: desc target: target ]
]

{ #category : #'code generation' }
AJx86JumpInstruction >> emitCodeAtOffset: offset assembler: asm [

	position := offset.
	[ | labelPos |
		labelPos := label position.
		labelPos ifNotNil: [ self emitCode: asm ].
		next ifNotNil: [
			next emitCodeAtOffset: offset + self machineCodeSize assembler: asm ].
		label position ~= labelPos ] whileTrue.

	label position ifNil: [ self errorUndefinedLabel: label  ]
]

{ #category : #'code generation' }
AJx86JumpInstruction >> emitConditionalJump: addr to: desc [
	^ {16r0F.
	(16r80 + desc opCode1).
	(addr bitAnd: 255).
	(addr >> 8 bitAnd: 255).
	(addr >> 16 bitAnd: 255).
	(addr >> 24 bitAnd: 255)} asByteArray
]

{ #category : #'code generation' }
AJx86JumpInstruction >> emitLongJump: desc target: target [
	| addr sz nextInstruction |

	sz := self isConditional
		ifTrue: [ 2 ]
		ifFalse: [ 1 ].

	nextInstruction := position + 4 + sz.
	addr := (AJImmediate ivalue: target - nextInstruction) asDoubleword.

	^ self isConditional
		ifFalse: [ self emitUnconditionalJumpTo: addr ]
		ifTrue: [ 	self emitConditionalJump: addr to: desc ]
]

{ #category : #'code generation' }
AJx86JumpInstruction >> emitShortJump: desc offset: delta [
	"short jump"
	^ self isConditional
		ifTrue: [ {(16r70 + desc opCode1). (delta asByte)} asByteArray ]
		ifFalse: [ {16rEB. (delta asByte)} asByteArray ]
]

{ #category : #'code generation' }
AJx86JumpInstruction >> emitUnconditionalJumpTo: addr [
	^ {
	16rE9.
	(addr bitAnd: 255).
	(addr >> 8 bitAnd: 255).
	(addr >> 16 bitAnd: 255).
	(addr >> 24 bitAnd: 255)} asByteArray
]

{ #category : #convenience }
AJx86JumpInstruction >> errorUndefinedLabel: aLabel [

	^ self error: 'undefined label: ', aLabel name
]

{ #category : #accessing }
AJx86JumpInstruction >> instructionDescriptions [
	^ AJx86InstructionDescription instructions
]

{ #category : #testing }
AJx86JumpInstruction >> isConditional [
	^ name ~~ #jmp
]

{ #category : #accessing }
AJx86JumpInstruction >> machineCodeSize [

	machineCode ifNil: [ ^ 2 ].

	^ machineCode size
]
