Class {
	#name : #TRCompilationTestShellRemote,
	#superclass : #TRCompilationTestShell,
	#classVars : [
		'Host'
	],
	#category : #'Tinyrossa-Tests-Shells-SmalltalkX'
}

{ #category : #accessing }
TRCompilationTestShellRemote class >> host [
	^ Host isNil ifTrue: [ 'unleashed' ] ifFalse: [ Host ]
]

{ #category : #accessing }
TRCompilationTestShellRemote class >> host: aString [
	Host := aString
]

{ #category : #running }
TRCompilationTestShellRemote >> setUp [
	super setUp.

	self assert: (OperatingSystem executeCommand: 'scp ' , debugger pathName , ' ' , self class host , ':/tmp')
		 description: 'Cannot upload shell'.

	target := GDBDebugger new.
	target executable: debugger.
	target send: 'target extended-remote | ssh -C ', self class host , ' /opt/gdb/bin/gdbserver - /tmp/' , debugger baseName.
]
