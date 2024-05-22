Class {
	#name : #TRCompilationTestShellRemoteUsingSSH,
	#superclass : #TRCompilationTestShell,
	#classVars : [
		'Host'
	],
	#category : #'Tinyrossa-Tests-Shells-SmalltalkX'
}

{ #category : #accessing }
TRCompilationTestShellRemoteUsingSSH class >> host [
	^ Host isNil ifTrue: [ 'unleashed' ] ifFalse: [ Host ]
]

{ #category : #accessing }
TRCompilationTestShellRemoteUsingSSH class >> host: aString [
	Host := aString
]

{ #category : #running }
TRCompilationTestShellRemoteUsingSSH >> setUp [
	| scpCmd |
	super setUp.

	scpCmd := 'scp ' , binary pathName , ' ' , self class host , ':/tmp'.


	self assert: (OSProcess new command: scpCmd) execute
		 description: 'Cannot upload shell'.

	(Smalltalk includesKey: #GDBDebugger) ifTrue:[
		"Use LibGDBs if available..."

		debugger := (Smalltalk at: #GDBDebugger) new.
		debugger executable: binary.
		debugger send: 'target extended-remote | ssh -C ', self class host , ' gdbserver - /tmp/' , binary baseName.
		^self
	] ifFalse:[
		self error: 'This shell require libgdbs'
	].
]
