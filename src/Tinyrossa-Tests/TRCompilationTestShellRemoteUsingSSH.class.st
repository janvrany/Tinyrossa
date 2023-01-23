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

	scpCmd := 'scp ' , debugger pathName , ' ' , self class host , ':/tmp'.


	self assert: (OperatingSystem executeCommand: scpCmd)
		 description: 'Cannot upload shell'.

	target := GDBDebugger new.
	target executable: debugger.
	target send: 'target extended-remote | ssh -C ', self class host , ' gdbserver - /tmp/' , debugger baseName.
]
