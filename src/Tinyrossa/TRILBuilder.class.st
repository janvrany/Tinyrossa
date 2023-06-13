Class {
	#name : #TRILBuilder,
	#superclass : #TRILBuilderBase,
	#instVars : [
		'location'
	],
	#pools : [
		'TRILOpcodeProps1',
		'TRILOpcodeProps3',
		'TRILOpcodes'
	],
	#category : #'Tinyrossa-IL-Builder'
}

{ #category : #'instance creation' }
TRILBuilder class >> forCompilation: aTRCompilation [
	^ self forCompilation: aTRCompilation block: aTRCompilation cfg addBlock
]

{ #category : #'instance creation' }
TRILBuilder class >> forCompilation: aTRCompilation block: aTRILBlock [
	^ self basicNew initializeWithCompilation: aTRCompilation block: aTRILBlock
]

{ #category : #'instance creation' }
TRILBuilder class >> new [
	self shouldNotImplement. "Use #forCompilation:"
]

{ #category : #'building-private' }
TRILBuilder >> build: opcode arguments: arguments [
	| node |

	"If the opcode to be added to current block is branching
	 and current block already constins branch, we cannot add it
	 to the current block..."
	(opcode isBranch and:[current isBranching]) ifTrue:[
		"...then create new block and transfer to it."
		| continue |

		continue := compilation cfg addBlock.
		self fallThroughToBlock: continue.
		current := continue.
	].

	node := super build: opcode arguments: arguments.
	node location: location.
	^ node
]

{ #category : #'defining symbols' }
TRILBuilder >> defineFunction: name type: type [
	| linkage |
	linkage := compilation config linkageClass.
	^self defineFunction: name type: type linkage: linkage
]

{ #category : #'defining symbols' }
TRILBuilder >> defineFunction: name type: type linkage: linkage [
	^ compilation symbolManager defineFunction: name type: type linkage: linkage
]

{ #category : #'building-blocks' }
TRILBuilder >> fallThroughTo: anILBuilder [
	self fallThroughToBlock: anILBuilder entry
]

{ #category : #'building-blocks' }
TRILBuilder >> fallThroughToBlock: block [
	| target |

	self assert: block isTRILBlock.   

	target := self transferTo: block.     
	current isTerminated ifFalse: [ 
		current successor1 notNil ifTrue: [ 
			target setSuccessor1: current successor1.
		].
		current setSuccessor1: target.
	].
]

{ #category : #'building-locations' }
TRILBuilder >> file: file line: line [
	self file: file line: line column: 0
]

{ #category : #'building-locations' }
TRILBuilder >> file: file line: line column: column [
	self location: (TRSourceLocation file: file line: line column: column)
]

{ #category : #'building-helpers' }
TRILBuilder >> for: variableName from: initialValue to: finalValue by: stepValue do: bodyBuilderOrClosure [
	| variable loadOp storeOp cmpleOp addOp setupBlock condBlock bodyBuilder incrementBlock joinBlock joinLabel |

	self assert: (compilation symbolManager hasSymbolNamed: variableName).
	variable := compilation symbolManager lookupSymbolByName: variableName. 
	self assert:(variable type = initialValue type).  
	self assert:(variable type = finalValue type).
	self assert:(variable type = stepValue type).

	loadOp := variable type loadOpcode.    
	storeOp := variable type storeOpcode.
	cmpleOp := variable type compareOpcodeFor: CompareTrueIfLess.
	addOp := variable type arithmeticOpcodeFor: Add.

	setupBlock := compilation cfg addBlock.
	condBlock := compilation cfg addBlock.
	bodyBuilder := self orphanIfNeeded: bodyBuilderOrClosure.
	incrementBlock := compilation cfg addBlock.
	joinBlock := compilation cfg addBlock.
	joinLabel := compilation symbolManager defineLabel: joinBlock.

	current setSuccessor1: setupBlock.

	setupBlock add: (TRILNode opcode: storeOp symbol: variable children: { initialValue }).
	setupBlock setSuccessor1: condBlock.

	condBlock add: (TRILNode opcode: cmpleOp reverseBranchOpcode ifCompareOpcode symbol: joinLabel children: {
							TRILNode opcode: loadOp symbol: variable .
							finalValue } ).
	condBlock setSuccessor1: bodyBuilder entry.

	bodyBuilder fallThroughToBlock: incrementBlock.

	incrementBlock add: (TRILNode opcode: storeOp symbol: variable children: { 
							TRILNode opcode: addOp children: {
								TRILNode opcode: loadOp symbol: variable .
								stepValue } } ).
	incrementBlock setSuccessor1: condBlock.

	current := joinBlock.
]

{ #category : #'building-helpers' }
TRILBuilder >> for: variableName from: initialValue to: finalValue do: bodyBuilderOrClosure [
	| stepValue |

	stepValue := TRILNode opcode: initialValue type constOpcode constant: 1.
	^ self for: variableName from: initialValue to: finalValue by: stepValue do: bodyBuilderOrClosure
]

{ #category : #'building-helpers' }
TRILBuilder >> if: compareNode then: thenBuilderOrClosure [
	| compareOp thenBuilder joinBlock joinLabel ifCompareNode |

	compareOp := compareNode opcode.
	self assert: compareOp isCompare.
	self assert: compareOp isBranch not.

	thenBuilder := self orphanIfNeeded: thenBuilderOrClosure.
	joinBlock := compilation cfg addBlock.
	joinLabel := compilation symbolManager defineLabel: joinBlock.

	ifCompareNode := (TRILNode opcode: compareOp reverseBranchOpcode ifCompareOpcode symbol: joinLabel children: { compareNode child1 . compareNode child2  }).
	ifCompareNode location: location.
	current add: ifCompareNode.

	self fallThroughTo: thenBuilder.
	thenBuilder fallThroughToBlock: joinBlock.

	current := joinBlock.
]

{ #category : #'building-helpers' }
TRILBuilder >> if: compareNode then: thenBuilderOrClosure else: elseBuilderOrClosure [
	| compareOp thenBuilder elseBuilder elseLabel joinBlock ifCompareNode |

	compareOp := compareNode opcode.
	self assert: compareOp isCompare.
	self assert: compareOp isBranch not.

	thenBuilder := self orphanIfNeeded: thenBuilderOrClosure.
	elseBuilder := self orphanIfNeeded: elseBuilderOrClosure.
	elseLabel := compilation symbolManager defineLabel: elseBuilder entry.
	joinBlock := compilation cfg addBlock.

	ifCompareNode := (TRILNode opcode: compareOp reverseBranchOpcode ifCompareOpcode symbol: elseLabel children: { compareNode child1 . compareNode child2  }).
	ifCompareNode location: location.
	current add: ifCompareNode. 

	self        fallThroughTo:      thenBuilder.
	thenBuilder fallThroughToBlock: joinBlock.  
	elseBuilder fallThroughToBlock: joinBlock.  

	current := joinBlock.
]

{ #category : #initialization }
TRILBuilder >> initializeWithCompilation: aTRCompilation block: aTRILBlock [
	super initializeWithCompilation: aTRCompilation block: aTRILBlock.
	location := nil.
]

{ #category : #accessing }
TRILBuilder >> location [
	^ location
]

{ #category : #accessing }
TRILBuilder >> location: aTRLocation [
	self assert: (aTRLocation isTRLocation or: [ aTRLocation isNil ]).

	location := aTRLocation.
]

{ #category : #'building-blocks' }
TRILBuilder >> orphan [
	^ self orphan: nil
]

{ #category : #'building-blocks' }
TRILBuilder >> orphan: nameOrNil [
	"Return a new subbuilder which may be used to build 
	 code fragments. The code has no relation to the receiver
	 (hence the name 'orphan') so caller is responsible to pass
	 control to orphan if it wishes (via `#goto:` or conditional
	 jump)."

	| orphan |
	
	orphan := self orphanClass forCompilation: compilation block: (compilation cfg addBlockNamed: nameOrNil).
	orphan location: location.
	^orphan
]

{ #category : #'building-blocks' }
TRILBuilder >> orphanClass [
	"Return the builder class for orphan builder - 
	 method #orphan will return an instance of this class.

	 See #orphan."

	^ TRILBuilder
]

{ #category : #'building-blocks' }
TRILBuilder >> orphanIfNeeded: builderOrClosure [
	"Helper method: return an orphan builder for given argument.

	 If argument (`builderOrClosure`) is a block, evaluate it passing
	 new orphan builder a parameter. 

	 If argument is (orphan) builder, justr return it.
	"
	| builder |

	builderOrClosure isBlock ifTrue: [
		builder := self orphan.
		self transferTo: builder entry.
		builderOrClosure value: builder.
	] ifFalse: [
		builder := builderOrClosure.
	].
	^ builder
]

{ #category : #'printing & storing' }
TRILBuilder >> printOn: aStream [

	super printOn:aStream.
	aStream nextPut:$(.
	current name printOn:aStream.
	aStream nextPut:$).
]

{ #category : #'building-helpers' }
TRILBuilder >> while: compareNode do: bodyBuilderOrClosure [
	| compareOp condBlock bodyBuilder joinBlock joinLabel ifCompareNode |

	compareOp := compareNode opcode.
	self assert: compareOp isCompare.
	self assert: compareOp isBranch not.

	condBlock := compilation cfg addBlock.
	bodyBuilder := self orphanIfNeeded: bodyBuilderOrClosure.
	joinBlock := compilation cfg addBlock.
	joinLabel := compilation symbolManager defineLabel: joinBlock.

	current setSuccessor1: condBlock.

	ifCompareNode := TRILNode opcode: compareOp reverseBranchOpcode ifCompareOpcode symbol: joinLabel children: { compareNode child1 . compareNode child2  }.
	ifCompareNode location: location.
	condBlock add: ifCompareNode.
	condBlock setSuccessor1: bodyBuilder entry.
	bodyBuilder fallThroughToBlock: condBlock.

	current := joinBlock.
]
