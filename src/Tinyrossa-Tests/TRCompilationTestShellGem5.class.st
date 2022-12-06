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
	| gem5dir gem5cmd |

	super setUp.

	gem5dir := OperatingSystem getEnvironment: 'GEM5_DIR'.

	self assert: gem5dir notNil description: 'GEM5_DIR environment not set!'.
	self assert: gem5dir asFileReference isDirectory description: 'GEM5_DIR not a directory!'.

	self assert: (gem5dir asFileReference / 'build' / target gem5 / 'gem5.opt') exists
		 description: 'No gem5 for ', target name , ' found in GEM5_DIR'.            

	gem5cmd := gem5dir , '/build/RISCV/gem5.opt "--debug-flags=Decode" ',gem5dir,'/configs/example/se.py -c ',binary pathName,' --wait-gdb --param ''system.shared_backstore = "/gem5"'''.
	"First, start gem5..."
	gem5 := OSProcess command: gem5cmd.
	"...and give it a time initialize itself..."
	(Delay forSeconds: 1) wait.   

	debugger := GDBDebugger new.
	debugger executable: binary.
	debugger targetConnect: 'remote' parameters: #('localhost:7000').
]

{ #category : #running }
TRCompilationTestShellGem5 >> tearDown [
	super tearDown.
	gem5 notNil ifTrue: [ 
		gem5 waitUntilFinishedWithTimeout: 1
	].
]
