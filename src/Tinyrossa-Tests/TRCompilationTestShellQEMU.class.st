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

	qemuCmd := target qemu, ' -g 1234 ', binary pathName.

	"First, start QEMU... "
	qemu := OSProcess new command: qemuCmd. 
	qemu startProcess.
	"...and give it a time initialize itself..."
	Delay waitForSeconds: 1.

	"...then setup debugger object (using either libgdbs or ULD)"    
	self setUpDebuggerOnHost: 'localhost' port: 1234.
]

{ #category : #running }
TRCompilationTestShellQEMU >> tearDown [
	super tearDown.
	qemu notNil ifTrue: [ 
		qemu waitUntilFinishedWithTimeout: 1
	].
]
