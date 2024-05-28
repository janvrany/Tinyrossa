"
I am the abstract superclass for all instructions used in the AJAssembler.
"
Class {
	#name : #AJInstruction,
	#superclass : #Object,
	#instVars : [
		'name',
		'operands',
		'machineCode',
		'position',
		'next',
		'annotations',
		'level'
	],
	#category : #'AsmJit-Instructions'
}

{ #category : #'instance creation' }
AJInstruction class >> new [
	"return an initialized instance"

	^ self basicNew initialize.
]

{ #category : #visitor }
AJInstruction >> accept: anObject [
	self subclassResponsibility
]

{ #category : #accessing }
AJInstruction >> annotation [
	<resource: #obsolete>

	self obsoleteMethodWarning: 'Use ArchC-compatible API #annotationAt:'.
	^ self annotationAt: String
]

{ #category : #accessing }
AJInstruction >> annotation: anObject [
	<resource: #obsolete>

	self obsoleteMethodWarning: 'Use ArchC-compatible API #annotationAdd:'.
	self annotationAdd: anObject
]

{ #category : #annotations }
AJInstruction >> annotationAdd: anObject [
	annotations isNil ifTrue: [
		annotations := Set with: anObject
	] ifFalse: [
		| annotation |

		annotation := self annotationAt: anObject class.
		annotation notNil ifTrue: [
			self error: 'Instruction already annotated with ', anObject class name.
			"You may want to #annotationAddOrReplace:"
		].
		annotations add: anObject
	].
]

{ #category : #annotations }
AJInstruction >> annotationAddOrReplace: anObject [
	annotations isNil ifTrue: [
		annotations := Set with: anObject
	] ifFalse: [
		| annotation |

		annotation := self annotationAt: anObject class.
		annotation notNil ifTrue: [
			annotations remove: annotation.
		].
		annotations add: anObject
	].
]

{ #category : #annotations }
AJInstruction >> annotationAt: aClass [
	annotations isNil ifTrue: [
		^ nil
	].
	^ annotations detect: [:e | e class == aClass ] ifNone: nil
]

{ #category : #annotations }
AJInstruction >> annotationRemove: anObject [
	annotations notNil ifTrue: [
		annotations remove: anObject ifAbsent: nil
	].
]

{ #category : #annotations }
AJInstruction >> annotationRemoveByKey: aClass [
	| annotation |

	annotation := self annotationAt: aClass.
	annotation notNil ifTrue: [
		self annotationRemove: annotation.
	].
]

{ #category : #annotations }
AJInstruction >> annotations [
	annotations isNil ifTrue: [ ^ #() ].
	^ annotations
]

{ #category : #annotations }
AJInstruction >> annotations: aCollection [
	"Set annotations. Old annotations (if any) are discarded."

	aCollection notNil ifTrue: [
		annotations := nil.
	].
	aCollection notNil ifTrue: [
		aCollection do: [:each | self annotationAdd: each ]
	]
]

{ #category : #asserting }
AJInstruction >> assert: aBlock description: aStringOrBlock [
	self flag: 'Unless AssertionFailure becomes an instance of Error we have to add this code. Pharo will catch up soon'.

	aBlock value
		ifFalse: [ Error signal: aStringOrBlock value ]
]

{ #category : #helpers }
AJInstruction >> checkOperandsForConflict [
	"Subclasses may signal an error here."
]

{ #category : #iterating }
AJInstruction >> do: aBlock [
	"evaluate all instructions for the list"
	| nn |
	nn := self.
	[ nn notNil ] whileTrue: [
		aBlock value: nn.
		nn := nn next.
	].
]

{ #category : #'code generation' }
AJInstruction >> emitCode: asm [
	machineCode := #[]

]

{ #category : #'code generation' }
AJInstruction >> emitCodeAtOffset: offset assembler: asm [
	| isReadyForEmition |
	position := offset.
	isReadyForEmition := true.
	self reifyOperandsWith: asm.
	self flag: 'TODO: Properly delegate this to emitLabel: methods'.
	self operandsDo: [:operand |
		isReadyForEmition := isReadyForEmition and: [ operand isReadyToEmit ]].
	isReadyForEmition
		ifTrue: [
			self emitCode: asm.
			next ifNotNil: [
				next
					emitCodeAtOffset: offset + self machineCodeSize
					assembler: asm ] ]
		ifFalse: [
			next ifNotNil: [
				next
					emitCodeAtOffset: offset + self binarySize
					assembler: asm ].
			self
				reifyOperandsWith: asm;
				emitCode: asm. ]
]

{ #category : #'double dispatching' }
AJInstruction >> emitImmediate: anImmediateOperand with: anOperand [
	^ anOperand emitOn: self immediate: anImmediateOperand
]

{ #category : #'code generation' }
AJInstruction >> emitLabel: anAJLabel [
	"By default we transform labels into immediates"
	self flag: 'TODO'
]

{ #category : #'double dispatching' }
AJInstruction >> emitMemory: memory register: register with: operand [
	^ operand emitOn: self memory: memory register: register
]

{ #category : #'double dispatching' }
AJInstruction >> emitMemory: aMemoryOperand with: anOperand [
	^ anOperand emitOn: self memory: aMemoryOperand
]

{ #category : #'double dispatching' }
AJInstruction >> emitMemory: memory with: operand1 with: operand2 [
	^ operand1 emitOn: self memory: memory with: operand2
]

{ #category : #'code generation' }
AJInstruction >> emitRegister: aRegister label: anAJLabel [
	"By default we transform labels into immediates"
	| labelPosition |
	anAJLabel hasPosition ifFalse: [ 1halt "todo..." ].
	labelPosition := anAJLabel position.
	anAJLabel isRelative
		ifTrue: [ labelPosition := labelPosition - ( position + self binarySize)].
	^ self
		emitRegister: aRegister
		immediate: labelPosition asAJOperand
]

{ #category : #'double dispatching' }
AJInstruction >> emitRegister: aRegister memory: memory with: anOperand [
	^ anOperand emitOn: self register: aRegister memory: memory
]

{ #category : #'double dispatching' }
AJInstruction >> emitRegister: register1 register: register2 with: anOperand [
	^ anOperand emitOn: self register: register1 register: register2
]

{ #category : #'double dispatching' }
AJInstruction >> emitRegister: aRegister with: anOperand [
	^ anOperand emitOn: self register: aRegister
]

{ #category : #'double dispatching' }
AJInstruction >> emitRegister: aRegister with: anOperand1 with: anOperand2 [
	^ anOperand1 emitOn: self register: aRegister with: anOperand2
]

{ #category : #accessing }
AJInstruction >> extractLabels: aBlock [
	self operandsDo: [:each |
		each extractLabels: aBlock ]
]

{ #category : #helpers }
AJInstruction >> find: aString [
	self shouldBeImplemented.
]

{ #category : #testing }
AJInstruction >> hasLabel [
	self shouldBeImplemented.
]

{ #category : #accessing }
AJInstruction >> increaseLevel: num [
	level := level + num
]

{ #category : #'initialize-release' }
AJInstruction >> initialize [
	level := 0
]

{ #category : #accessing }
AJInstruction >> insert: anInstruction [
	| oldNext |

	oldNext := next.
	next := anInstruction.
	anInstruction do: [:each | each increaseLevel: level ].
	anInstruction last next: oldNext
]

{ #category : #manipulating }
AJInstruction >> insert: newInstruction before: anInstruction [

	"replace a single instruction with one or more other instructions"
	| instr  anext |

	anInstruction == self ifTrue: [
		newInstruction last next: self.
		^ newInstruction ].

	instr := self.
	[ (anext := instr next) notNil and: [ anext ~~ anInstruction ]] whileTrue: [ instr := anext ].

	instr next ifNotNil: [
		newInstruction do: [:each |
			each increaseLevel: instr level
			].
		newInstruction last next: instr next.
		instr next: newInstruction ].
]

{ #category : #accessing }
AJInstruction >> instructionName [
	^ name
]

{ #category : #testing }
AJInstruction >> isLabelUsed: anAJJumpLabel [
	^ false
]

{ #category : #iterating }
AJInstruction >> last [
	"answer the last instruction in the list"
	| nn l |
	nn := self.
	[ (l := nn next) notNil ] whileTrue: [ nn := l ].
	^ nn
]

{ #category : #accessing }
AJInstruction >> level [
	^ level
]

{ #category : #accessing }
AJInstruction >> level: aLevel [
	level := aLevel
]

{ #category : #accessing }
AJInstruction >> machineCodeSize [
	^ machineCode ifNil: [ 0 ] ifNotNil: [ machineCode size ]
]

{ #category : #accessing }
AJInstruction >> name [
	^ name
		ifNil: ['undefined']
]

{ #category : #accessing }
AJInstruction >> name: anObject [
	name := anObject
]

{ #category : #accessing }
AJInstruction >> next [
	^ next
]

{ #category : #accessing }
AJInstruction >> next: anInstruction [
	next := anInstruction
]

{ #category : #accessing }
AJInstruction >> operands [
	^ operands
]

{ #category : #accessing }
AJInstruction >> operands: anObject [
	operands := anObject
]

{ #category : #accessing }
AJInstruction >> operandsDo: aBlock [
	operands ifNotNil: [ operands do: aBlock ]
]

{ #category : #accessing }
AJInstruction >> position [
	^ position
]

{ #category : #accessing }
AJInstruction >> position: anObject [
	position := anObject
]

{ #category : #'function calls' }
AJInstruction >> prepareCallAlignments [
	"do nothing"
]

{ #category : #printing }
AJInstruction >> printAnnotationOn: aStream [
	| comment |

	comment := self annotationAt: String.
	comment isNil ifTrue: [ ^ self ].
	aStream nextPut: $";
		 nextPutAll: comment asString;
		 nextPut: $";
		 cr.
	self printIndentOn: aStream
]

{ #category : #printing }
AJInstruction >> printIndentOn: aStream [
	level ifNil: [ ^ self ].
	level timesRepeat: [ aStream nextPutAll: '|   ']
]

{ #category : #printing }
AJInstruction >> printListOn: aStream [

	self
		printIndentOn: aStream;
		printSelfOn: aStream.

	next ifNotNil: [
		aStream cr.
		next printListOn: aStream ]
]

{ #category : #printing }
AJInstruction >> printMachineCodeOn: aStream [
	(machineCode isNil or: [ machineCode isEmpty ])
		ifTrue: [^ self].
	aStream padColumn: 65;
		 nextPutAll: '#['.
	machineCode isCollection
		ifTrue: [
			machineCode
				do: [ :byte |
					byte printOn: aStream base: 16 length: 2 padded: true ]
				separatedBy: [ aStream space ]]
		ifFalse: [ aStream nextPutAll: '???' ].
	aStream nextPut: $]
]

{ #category : #printing }
AJInstruction >> printOn: aStream [
"[ ^self ] value."

	self printListOn: aStream asLineStream
]

{ #category : #printing }
AJInstruction >> printOperandsOn: aStream [
	(operands notNil
			and: [operands isEmpty not])
		ifTrue: [aStream space; nextPut: $(.
			operands
				do: [ :operand | operand printAsOperandOn: aStream]
				separatedBy: [aStream space].
			aStream nextPut: $)]
]

{ #category : #printing }
AJInstruction >> printSelfOn: aStream [
	self printAnnotationOn: aStream.
	aStream nextPutAll: self name.
	self printOperandsOn: aStream.
	self printMachineCodeOn: aStream
]

{ #category : #printing }
AJInstruction >> printStringLimitedTo: aNumber [
	^ String streamContents: [:s | self printOn: s]
]

{ #category : #visitor }
AJInstruction >> processTempsWith: anObject [
	"do nothing"
]

{ #category : #'code generation' }
AJInstruction >> reifyOperand: anOperand with: anAJAssembler [
	| operand |
	operand := anOperand asAJOperand.
	self flag: 'Try avoiding #asAJOperand and the return in the end'.
	operand isLabel
		ifTrue: [ operand position: (anAJAssembler labelNamed: operand label) position ].
	^ operand

]

{ #category : #'code generation' }
AJInstruction >> reifyOperandsWith: anAJAssembler [
	operands := operands ifNil: [ OrderedCollection new ] .
	operands := operands collect: [ :each | self reifyOperand: each with: anAJAssembler ].

]

{ #category : #manipulating }
AJInstruction >> replace: anInstruction with: otherInstructions [

	"replace a single instruction with one or more other instructions"
	| instr |

	anInstruction == self ifTrue: [
		otherInstructions last next: self next.
		^ otherInstructions ].

	instr := self.
	[ instr notNil and: [instr next ~~ anInstruction ]] whileTrue: [ instr := instr next ].
	instr notNil ifTrue: [
		otherInstructions last next: instr next next.
		instr next: otherInstructions
		].
]

{ #category : #visitor }
AJInstruction >> setPrologue: anInstruction [
	"do nothing"
]

{ #category : #printing }
AJInstruction >> storeOn: aStream [
	"store machine code to binary stream"
	machineCode ifNotNil: [
		aStream nextPutAll: machineCode
		]
]

{ #category : #validation }
AJInstruction >> validate [
	"Validate this instruction. For instance check if all operands are compatible and properly initialized"
]
