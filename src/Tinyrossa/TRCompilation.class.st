Class {
	#name : #TRCompilation,
	#superclass : #Object,
	#instVars : [
		'symbolManager',
		'il',
		'codeBuffer'
	],
	#category : #'Tinyrossa-Compile'
}

{ #category : #'instance creation' }
TRCompilation class >> new [
	"return an initialized instance"

	^ self basicNew initialize.
]

{ #category : #accessing }
TRCompilation >> builder [
	^ TRILFunctionBuilder forCompilation: self
]

{ #category : #accessing }
TRCompilation >> codeBuffer [
	^ codeBuffer
]

{ #category : #accessing }
TRCompilation >> codegen [
	
	"FIXME: This should depend on compilation target!"
	^ (Smalltalk at:#TRRV64GCodeGenerator) forCompilation: self
]

{ #category : #compiling }
TRCompilation >> compile [
	| codegen |

	codegen := self codegen.
	codeBuffer := codegen codeBuffer.
	codegen generatePrologue.
	codegen generateCode: il.
	codegen allocateRegisters.
]

{ #category : #accessing }
TRCompilation >> il [
	^ il
]

{ #category : #initialization }
TRCompilation >> initialize [
	"Invoked when a new instance is created."

	il := OrderedCollection new.
	symbolManager := TRSymbolManager new
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
