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

	"First, linearize blocks."
	queue := Stack with: entry.
	seen := Set with: entry.
	[ queue notEmpty ] whileTrue: [ 
		| block |

		block := queue pop.
		(block successor2 notNil and:[(seen includes: block successor2) not]) ifTrue: [ 
			queue push: block successor2.
			seen add: block successor2.
		].
		(block successor1 notNil and:[(seen includes: block successor1) not]) ifTrue: [ 
			queue push: block successor1.
			seen add: block successor1.
		].
		queue notEmpty ifTrue: [ 
			block setNext: queue top.
		].
	].

	"Now, inject jumps where needed"
	block := entry.
	[ block notNil ] whileTrue: [ 
		(block successor1 notNil and:[block next ~~ block successor1]) ifTrue: [ 
			| builder |

			builder := TRILBuilder forCompilation: self block: block.
			builder goto: block successor1.
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
