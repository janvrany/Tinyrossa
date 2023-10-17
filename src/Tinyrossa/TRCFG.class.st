Class {
	#name : #TRCFG,
	#superclass : #Object,
	#instVars : [
		'compilation',
		'blocks',
		'entry',
		'nextBlockId'
	],
	#pools : [
		'TRILOpcodes'
	],
	#category : #'Tinyrossa-IL-CFG'
}

{ #category : #'instance creation' }
TRCFG class >> forCompilation: aTRCompilation [
	^ self basicNew initializeWithCompilation: aTRCompilation
]

{ #category : #'instance creation' }
TRCFG class >> new [
	self shouldNotImplement. "Use #forCompilation:"
]

{ #category : #'adding & removing' }
TRCFG >> addBlock [
	^ self addBlockNamed: nil
]

{ #category : #'adding & removing' }
TRCFG >> addBlockNamed: aStringOrNil [
	| name block |

	aStringOrNil notNil ifTrue: [ 
		name := aStringOrNil.
	] ifFalse: [ 
		name := 'BB_' , (nextBlockId printLeftPaddedWith: $0 to: 3 base: 10)
	].
	nextBlockId := nextBlockId + 1.

	self assert: (blocks contains: [:e | e name = name ]) not.

	block := TRILBlock forCFG: self named: name.
	blocks add: block.
	entry isNil ifTrue:[self entry: block].

	^ block
]

{ #category : #accessing }
TRCFG >> blocks [
	"Return the list of all *reachable* blocks"

	| reachable |

	reachable := OrderedCollection new: blocks size.
	self preorderDo: [ :block | reachable add: block ].
	^ reachable.
]

{ #category : #accessing }
TRCFG >> compilation [
	^compilation
]

{ #category : #accessing }
TRCFG >> entry [
	"Return the entry block"
	self assert: entry notNil.

	^ entry
]

{ #category : #accessing }
TRCFG >> entry: aTRILBlock [
	"Set the entry block. 
	
	 Please note that entry block is set automatically when first block
	 is allocated. This method is for internal use in cases one need
	 modify entry block after TRIL is generated (for example, CFG simplifier
	 removing empty entry block)."

	entry := aTRILBlock
]

{ #category : #initialization }
TRCFG >> initializeWithCompilation: aTRCompilation [
	compilation := aTRCompilation.
	blocks := Set new.
	entry := nil.
	nextBlockId := 0.
]

{ #category : #enumerating }
TRCFG >> linearDo: aBlock [
	"Traverse the CFG in linear order, starting with entry block.
	 This may be called only after blocks are linearized (see
	 #linearize).

	 `aBlock` is evaluated exactly once for every block reachable
	 from entry. It's not evaluated at all for blocks that are not
	 reachable."
	| block |        

	self assert: entry notNil.

	block := entry.
	[ block notNil ] whileTrue:[
		aBlock value: block.
		block := block next.
	].
]

{ #category : #operations }
TRCFG >> linearize [
	"Order blocks into linear list."
	| queue seen block |

	self assert: entry notNil.

	"Linearize blocks"
	queue := Stack with: entry.
	seen := Set with: entry.
	[ queue notEmpty ] whileTrue: [ 
		| this next |

		"First, add successors of this block to the queue"
		this := queue pop.
		(this successor2 notNil and:[(seen includes: this successor2) not]) ifTrue: [ 
			queue push: this successor2.
			seen add: this successor2.
		].
		(this successor1 notNil and:[(seen includes: this successor1) not]) ifTrue: [ 
			queue push: this successor1.
			seen add: this successor1.
		].

		"Second, link this to the next (i.e., establish linear order of blocks)"
		queue notEmpty ifTrue: [ 
			next := queue top.
		] ifFalse:[
			next := nil. "no more blocks"
		].
		"Now, if 'this' block is not terminated and 'next' (next in linear order sense)
		 is not successor1 (i.e., pass-through block), we need to inject a goto.
		 We do this by inserting artificial pass-through block with single goto node."
		(this isTerminated not and:[this successor1 ~~ next]) ifTrue: [ 
			| jump jumpBlock |

			jump := TRILNode opcode: goto symbol: (compilation symbolManager defineLabel: this successor1).
			jump location: (this treetops at: this treetops size - 1) location.

			jumpBlock := self addBlock.
			jumpBlock add: jump.

			this setSuccessor1: jumpBlock.
			this setNext: jumpBlock.
			jumpBlock setNext: next.
		] ifFalse: [ 
			this setNext: next.
		].
	].

	"Validate linear order"
	block := self entry.
	[ block notNil ] whileTrue: [ 
		block isTerminated ifFalse: [
			self assert: block successor1 notNil.
			self assert: block successor1 == block next.
		].
		block := block next.
	].
]

{ #category : #enumerating }
TRCFG >> postorderDo: aBlock [
	"Traverse the CFG starting with entry block and evaluate 
	 `aBlock` for each block in depth-first post-order manner.

	 `aBlock` is evaluated exactly once for every block reachable
	 from entry. It's not evaluated at all for blocks that are not
	 reachable."

	| preorder |

	preorder := OrderedCollection new: blocks size.
	self preorderDo: [ :block | preorder add: block ].
	preorder reverseDo: aBlock.
]

{ #category : #enumerating }
TRCFG >> preorderDo: aBlock [
	"Traverse the CFG starting with entry block and evaluate 
	 `aBlock` for each block in depth-first pre-order manner.

	 `aBlock` is evaluated exactly once for every block reachable
	 from entry. It's not evaluated at all for blocks that are not
	 reachable."

	| stack seen |

	self assert: entry notNil.

	stack := Stack with: entry.
	seen := Set with: entry.
	[ stack notEmpty ] whileTrue: [ 
		| block |

		block := stack pop.
		aBlock value: block.

		(block successor2 notNil and:[(seen includes: block successor2) not]) ifTrue: [ 
			stack push: block successor2.
			seen add: block successor2.
		].
		(block successor1 notNil and:[(seen includes: block successor1) not]) ifTrue: [ 
			stack push: block successor1.
			seen add: block successor1.
		].      
	].
]

{ #category : #operations }
TRCFG >> prune [
	"Prune the CFG: discard all unreachable blocks."
	
	| unreachable |
	
	unreachable := blocks copy.
	self preorderDo: [ :block | unreachable remove: block ].
	
	unreachable do:[ :block |
			block removeAll. 
			blocks remove: block.
	]
	
]

{ #category : #accessing }
TRCFG >> treetops [
	"Return a collection of treetops of every block 
	 in this control flow graph (reachable from entry block).
	
	 Treetops are returned in pre-order manner, successor's 
	 treetops before precedessor's. 
	 "
	| treetops |
	
	treetops :=OrderedCollection new.
	self treetopsDo: [ :node | 
		treetops add: node.
	].
	^treetops
]

{ #category : #'enumerating - nodes' }
TRCFG >> treetopsDo: aBlock [
	"Evaluate aBlock for each treetop of each block
	 in this control flow graph  (reachable from entry block).
	
	 Block is evaluated in pre-order manner, successor's 
	 treetops before precedessor's. 
	 "
	self preorderDo: [ :block |
		block treetopsDo: aBlock.
	]
]
