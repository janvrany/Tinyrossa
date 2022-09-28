Class {
	#name : #TRCompilationConfig,
	#superclass : #Object,
	#instVars : [
		'codeGeneratorClass',
		'linkageClass'
	],
	#category : #'Tinyrossa-Compile'
}

{ #category : #options }
TRCompilationConfig >> codeGeneratorClass [
	^ codeGeneratorClass
]

{ #category : #options }
TRCompilationConfig >> codeGeneratorClass:aClass [
	self assert: (aClass inheritsFrom: TRCodeGenerator).
	codeGeneratorClass := aClass.
]

{ #category : #options }
TRCompilationConfig >> linkageClass [
	^ linkageClass
]

{ #category : #options }
TRCompilationConfig >> linkageClass:something [
	linkageClass := something.
]
