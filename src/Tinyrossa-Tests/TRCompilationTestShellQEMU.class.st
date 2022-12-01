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

	self assert: (OperatingSystem pathOfCommand: qemuCmd) notNil description: 'QEMU not found'.
	"First, start QEMU... "
	qemu := OSProcess new command: qemuCmd , ' -g 1234 ', binary pathName.
	qemu startProcess.
	"...and give it a time initialize itself..."
	Delay waitForSeconds: 1.

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
