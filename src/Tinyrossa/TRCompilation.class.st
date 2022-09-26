Class {
	#name : #TRCompilation,
	#superclass : #Object,
	#instVars : [
		'config',
		'symbolManager',
		'entry',
		'codeBuffer'
	],
	#category : #'Tinyrossa-Compile'
}

{ #category : #'instance creation' }
TRCompilation class >> forConfig: aTRCompilationConfig [
	^ self basicNew initializeWithConfig: aTRCompilationConfig
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
			builder goto: block successor1 name.
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
	^ codeBuffer
]

{ #category : #accessing }
TRCompilation >> codegen [
	^config codeGeneratorClass forCompilation: self
]

{ #category : #compiling }
TRCompilation >> compile [
	| codegen |

	codegen := self codegen.
	codeBuffer := codegen codeBuffer.
	codegen generatePrologue.
	codegen generateCode: self il.
	codegen allocateRegisters.
	codegen fixupBranchTargets.
]

{ #category : #accessing }
TRCompilation >> config [
	^ config
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
	TRILBlock initialize. "FIXME: Temporary, to reset counter"
	entry := TRILBlock new.
]

{ #category : #optimizing }
TRCompilation >> optimize [
	| simplifier |

	simplifier := TRILSimplifier forCompilation: self.
	simplifier simplify.
]

{ #category : #accessing }
TRCompilation >> symbolManager [
	^ symbolManager
]
