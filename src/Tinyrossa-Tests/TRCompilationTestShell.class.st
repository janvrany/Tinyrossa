Class {
	#name : #TRCompilationTestShell,
	#superclass : #TestAsserter,
	#instVars : [
		'target',
		'binary',
		'debugger'
	],
	#classVars : [
		'DefaultImpl'
	],
	#category : #'Tinyrossa-Tests-Shells-SmalltalkX'
}

{ #category : #accessing }
TRCompilationTestShell class >> defaultImpl [
	DefaultImpl isNil ifTrue: [ ^ TRCompilationTestShellQEMU ].
	^ DefaultImpl
]

{ #category : #'instance creation' }
TRCompilationTestShell class >> forTarget: aTRCompilationTarget [
	self == TRCompilationTestShell ifTrue: [ 
		^ self defaultImpl forTarget: aTRCompilationTarget
	] ifFalse: [ 
		^ self new initializeWithTarget: aTRCompilationTarget
	].
]

{ #category : #accessing }
TRCompilationTestShell >> debugger [
	self assert: debugger notNil.
	^ debugger
]

{ #category : #initialization }
TRCompilationTestShell >> initializeWithTarget: aTRCompilationTarget [
	target := aTRCompilationTarget.
	self setUp; reset.
]

{ #category : #accessing }
TRCompilationTestShell >> nzone [
	"Return the address of nzone. See shell.link linker script."

	^ 16r00080000
]

{ #category : #running }
TRCompilationTestShell >> reset [
	self debugger setRegister: 'pc' to: self nzone
]

{ #category : #running }
TRCompilationTestShell >> setUp [
	| path |

	path := (Smalltalk getPackageDirectoryForPackage: self class package).
	self assert: path notNil.
	path := path / '..' / '..' / 'shell'.
	self assert: path isDirectory.

	binary := path / ('shell-' , (target name upTo: $-)).
	self assert: binary isExecutable.
]

{ #category : #running }
TRCompilationTestShell >> tearDown [
	(debugger notNil and: [ debugger isConnected ]) ifTrue: [
		 debugger send: 'kill'.
		 (Smalltalk includesKey: #VDBDebuggerApplication) ifTrue: [ 
			 ((Smalltalk at: #VDBDebuggerApplication) allInstances allSatisfy:[:vdbApp | vdbApp debugger ~~ target]) ifTrue: [ 
				 debugger send: 'quit' andWait: false.
			 ].
		 ].
	 ].
	 debugger := nil.
]
