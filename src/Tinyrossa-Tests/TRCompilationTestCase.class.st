Class {
	#name : #TRCompilationTestCase,
	#superclass : #TestCase,
	#instVars : [
		'compilation',
		'shell'
	],
	#category : #'Tinyrossa-Tests'
}

{ #category : #running }
TRCompilationTestCase >> setUpForTarget: aTRCompilationTarget [
	compilation := TRCompilation forTarget: aTRCompilationTarget.
	shell := TRCompilationTestShell forTarget: aTRCompilationTarget.
]

{ #category : #running }
TRCompilationTestCase >> tearDown [
	super tearDown.
	shell notNil ifTrue: [ 
		shell tearDown.
		shell := nil.
	].
]
