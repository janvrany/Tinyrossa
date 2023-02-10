Class {
	#name : #TRCompilation,
	#superclass : #Object,
	#instVars : [
		'config',
		'symbolManager',
		'functionSymbol',
		'entry',
		'codegen'
	],
	#pools : [
		'TRILOpcodes'
	],
	#category : #'Tinyrossa-Compile'
}

{ #category : #'instance creation' }
TRCompilation class >> forConfig: aTRCompilationConfig [
	^ self basicNew initializeWithConfig: aTRCompilationConfig
]

{ #category : #'instance creation' }
TRCompilation class >> forTarget: aTRCompilationTarget [
	^ self forConfig: (TRCompilationConfig forTarget: aTRCompilationTarget)
]

{ #category : #'instance creation' }
TRCompilation class >> new [
	self shouldNotImplement. "Use #forConfig:"
]

{ #category : #'building IL' }
TRCompilation >> buildFinished [
	"To be used by frontend to indicate that IL building is done."

	| queue seen block |

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
			| jump |
			jump := TRILBlock forCompilation: self.
			jump add: (TRILNode opcode: goto symbol: (symbolManager lookupLabelByBlock: this successor1)).

			this setSuccessor1: jump.
			this setNext: jump.
			jump setNext: next.
		] ifFalse: [ 
			this setNext: next.
		].
	].

	"Validate linear order"
	block := entry.
	[ block notNil ] whileTrue: [ 
		block isTerminated ifFalse: [
			self assert: block successor1 notNil.
			self assert: block successor1 == block next.
		].
		block := block next.
	].
	"
	self il.
	"
]

{ #category : #'building IL' }
TRCompilation >> builder [
	"Return a top-level builder to be used to build
	 the IL. Once the frontend is done building, it MUST
	 send #buildFinished to compilation."

	^ TRILFunctionBuilder forCompilation: self block: entry.
]

{ #category : #accessing }
TRCompilation >> codeBuffer [
	^ self codegen codeBuffer
]

{ #category : #accessing }
TRCompilation >> codegen [    
	codegen isNil ifTrue:[
		codegen := config codeGeneratorClass forCompilation: self.
	].
	^ codegen
]

{ #category : #compiling }
TRCompilation >> compile [
	| cg |

	cg := self codegen.
	cg generate: self il.

	config aot ifTrue: [ 
		| objgen |    

		objgen := TRELFGenerator forCompilation: self.
		objgen generateObjectFile
	].
]

{ #category : #accessing }
TRCompilation >> config [
	^ config
]

{ #category : #accessing }
TRCompilation >> entry [
	"Return function's entry block."
	^ entry
]

{ #category : #accessing }
TRCompilation >> functionSymbol [
	"Return a symbol representing currently compiled function."
	^ functionSymbol
]

{ #category : #accessing }
TRCompilation >> functionType [
	"Return currently compiled function return type"
	^ functionSymbol type
]

{ #category : #accessing }
TRCompilation >> il [
	"Return linearized sequence of `TRILNode`s"

	| il block |

	il := OrderedCollection new.
	block := entry.
	[ block notNil ] whileTrue: [
		il addAll: block treetops.
		block := block next.
	].
	^ il
]

{ #category : #initialization }
TRCompilation >> initializeWithConfig: aTRCompilationConfig [
	config := aTRCompilationConfig.
	symbolManager := TRSymbolManager new.
	entry := TRILBlock forCompilation: self named: 'entry'
]

{ #category : #optimizing }
TRCompilation >> optimize [
	| simplifier |

	simplifier := TRILSimplifier forCompilation: self.
	simplifier simplify.
]

{ #category : #initialization }
TRCompilation >> setFunctionSymbol: aTRFunctionSymbol [
	self assert: aTRFunctionSymbol isTRFunctionSymbol.
	self assert: functionSymbol isNil.

	functionSymbol := aTRFunctionSymbol
]

{ #category : #accessing }
TRCompilation >> symbolManager [
	^ symbolManager
]
