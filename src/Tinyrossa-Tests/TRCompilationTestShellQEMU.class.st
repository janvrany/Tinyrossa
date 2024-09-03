Class {
	#name : #TRCompilationTestShellQEMU,
	#superclass : #TRCompilationTestShell,
	#instVars : [
		'qemu'
	],
	#classVars : [
		'QemuDebugPortRandom'
	],
	#category : #'Tinyrossa-Tests-Shells'
}

{ #category : #initialization }
TRCompilationTestShellQEMU class >> initialize [
	QemuDebugPortRandom := Random new seed: 1234
]

{ #category : #running }
TRCompilationTestShellQEMU >> setUp [
	| qemuDebugPort qemuCmd |

	super setUp.

	"Randomize port where QEMU's debug stub is listening.
	 This is to allow running tests simultaneously on both
	 Smalltalk/X and Pharo (as they take some time to finish)."

	Smalltalk isSmalltalkX ifTrue: [
		qemuDebugPort := 30000 + (QemuDebugPortRandom nextInt: 1000).
	] ifFalse: [
		qemuDebugPort := 31000 + (QemuDebugPortRandom nextInt: 1000).
	].

	qemuCmd := target qemu, ' -g ', qemuDebugPort printString, ' ', binary pathString.

	"First, start QEMU... "
	qemu := OSProcess new command: qemuCmd. 
	qemu startProcess.
	"...and give it a time initialize itself..."
	(Delay forSeconds: 1) wait.

	"...then setup debugger object (using either libgdbs or ULD)"    
	self setUpDebuggerOnHost: 'localhost' port: qemuDebugPort.
]

{ #category : #running }
TRCompilationTestShellQEMU >> tearDown [
	super tearDown.
		(qemu notNil and:[qemu isComplete not ]) ifTrue: [ 
		qemu terminate		
	].
]
