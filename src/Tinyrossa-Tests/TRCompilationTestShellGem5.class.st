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
	| gem5cmd |

	super setUp.

	self assert: (OperatingSystem getEnvironment:'GEM5_DIR') notNil
		 description: 'GEM5_DIR environment not set!'.

	self assert: ((OperatingSystem getEnvironment:'GEM5_DIR') asFilename / 'build' / 'RISCV' / 'gem5.opt') exists
		 description: 'No RISC-V gem5 found in GEM5_DIR'.            

	gem5cmd := '%1/build/RISCV/gem5.opt "--debug-flags=Decode" %1/configs/example/se.py -c %2 --wait-gdb --param ''system.shared_backstore = "/gem5"'''
				bindWith: (OperatingSystem getEnvironment:'GEM5_DIR')
					with: debugger pathName.

	"First, start gem5..."
	gem5 := OSProcess new command: gem5cmd.
	gem5 startProcess.
	"...and give it a time initialize itself..."
	Delay waitForSeconds: 1.   

	target := GDBDebugger new.
	target executable: debugger.
	target send: 'target remote localhost:7000'
]

{ #category : #running }
TRCompilationTestShellGem5 >> tearDown [
	super tearDown.
	gem5 notNil ifTrue: [ 
		gem5 waitUntilFinishedWithTimeout: 1
	].
]
