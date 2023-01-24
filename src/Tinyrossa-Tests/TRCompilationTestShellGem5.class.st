Class {
	#name : #TRCompilationTestShellGem5,
	#superclass : #TRCompilationTestShell,
	#instVars : [
		'gem5'
	],
	#classVars : [
		'Host'
	],
	#category : #'Tinyrossa-Tests-Shells-SmalltalkX'
}

{ #category : #accessing }
TRCompilationTestShellGem5 class >> host [
	^ Host isNil ifTrue: [ 'unleashed' ] ifFalse: [ Host ]
]

{ #category : #accessing }
TRCompilationTestShellGem5 class >> host: aString [
	Host := aString
]

{ #category : #running }
TRCompilationTestShellGem5 >> setUp [
	| gem5dir gem5exe gem5cmd |

	super setUp.

	gem5dir := Smalltalk os getEnvironment: 'GEM5_DIR'.
	self assert: gem5dir notNil description: 'GEM5_DIR environment not set!'.

	gem5exe := gem5dir asFileReference / 'build' / target gem5 / 'gem5.debug'.
	gem5exe exists ifFalse: [ 
		gem5exe := gem5dir asFileReference / 'build' / target gem5 / 'gem5.opt'.
	].

	self assert: gem5exe exists description: 'No gem5.debug nor gem5.opt found in GEM5_DIR/build/',target gem5.            

	gem5cmd := '<1s> --listener-mode on "--debug-flags=Decode" <2s>/configs/example/se.py -c <3s> --wait-gdb --param ''system.shared_backstore = "/gem5"'''
				expandMacrosWith: gem5exe pathString with: gem5dir with: binary pathString.

	"First, start gem5..."
	gem5 := OSProcess new command: gem5cmd.
	gem5 startProcess.
	"...and give it a time initialize itself..."
	(Delay forSeconds: 1) wait.   

	"...then setup debugger object (using either libgdbs or ULD)"        
	self setUpDebuggerOnHost: 'localhost' port: 7000.
]

{ #category : #running }
TRCompilationTestShellGem5 >> tearDown [
	super tearDown.
	(gem5 notNil and:[gem5 isComplete not ]) ifTrue: [ 
		gem5 terminate		
	].
]
