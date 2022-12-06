Class {
	#name : #TRCompilationTestShellQEMU,
	#superclass : #TRCompilationTestShell,
	#instVars : [
		'qemu'
	],
	#category : #'Tinyrossa-Tests-Shells-SmalltalkX'
}

{ #category : #running }
TRCompilationTestShellQEMU >> setUp [
	| qemuCmd |

	super setUp.

	qemuCmd := target qemu.
	
	"First, start QEMU... "
	qemu := OSProcess command: qemuCmd , ' -g 1234 ', binary pathName.
	"...and give it a time initialize itself..."
	(Delay forSeconds: 1) wait.

	"...then create a new GDB and connect to QEMU: "
	debugger := GDBDebugger new.
	debugger executable: binary.
	debugger targetConnect: 'remote' parameters: #('localhost:1234').
]

{ #category : #running }
TRCompilationTestShellQEMU >> tearDown [
	super tearDown.
	qemu notNil ifTrue: [ 
		qemu waitUntilFinishedWithTimeout: 1
	].
]
