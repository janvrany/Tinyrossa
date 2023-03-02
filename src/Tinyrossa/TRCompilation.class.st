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
	"Compile generated IL to machine code."

	cfg linearize.
	self codegen generate.
	self isAOT ifTrue: [ 
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

{ #category : #initialization }
TRCompilation >> initializeWithConfig: aTRCompilationConfig [
	| entry |

	config := aTRCompilationConfig.
	symbolManager := TRSymbolManager new.
	cfg := TRCFG forCompilation: self.

	entry := cfg addBlockNamed: 'entry'.
	symbolManager defineLabel: entry.
]

{ #category : #testing }
TRCompilation >> isAOT [
	"Return true, if this compilation is AOT compilation,
	 false if it is JIT compilation."

	^ config aot
]

{ #category : #testing }
TRCompilation >> isJIT [
	"Return true, if this compilation is JIT compilation,
	 false if it is AOT compilation."

	^ config aot not
]

{ #category : #optimizing }
TRCompilation >> optimize [
	{
		TRILSimplifier .
	} do: [:pass | (pass forCompilation: self) run ]
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
