Class {
	#name : #TRCompilationConfig,
	#superclass : #Object,
	#instVars : [
		'codeGeneratorClass'
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
