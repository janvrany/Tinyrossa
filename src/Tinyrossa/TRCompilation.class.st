Class {
	#name : #TRCompilation,
	#superclass : #Object,
	#instVars : [
		'config',
		'symbolManager',
		'functionSymbol',
		'cfg',
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
	cfg linearize
]

{ #category : #'building IL' }
TRCompilation >> builder [
	"Return a top-level builder to be used to build
	 the IL. Once the frontend is done building, it MUST
	 send #buildFinished to compilation."

	^ TRILFunctionBuilder forCompilation: self
]

{ #category : #accessing }
TRCompilation >> cfg [
	^ cfg
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
	cg generate.

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
	^ cfg entry
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
	block := cfg entry.
	[ block notNil ] whileTrue: [
		il addAll: block treetops.
		block := block next.
	].
	^ il
]

{ #category : #initialization }
TRCompilation >> initializeWithConfig: aTRCompilationConfig [
	| entry |

	config := aTRCompilationConfig.
	symbolManager := TRSymbolManager new.
	cfg := TRCFG forCompilation: self.

	entry := cfg addBlockNamed: 'entry'.
	symbolManager defineLabel: entry.
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
