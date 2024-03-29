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

{ #category : #accessing }
TRCompilationTestShell class >> defaultImpl: aClass [
	"Set default shell class"

	self assert: (aClass inheritsFrom: TRCompilationTestShell).
	DefaultImpl := aClass
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
TRCompilationTestShell class >> shellDirectory [
	"Return a directory (as file reference) containing compiled shell binaries
	 or nil if directory cound not be found."
	Smalltalk isSmalltalkX ifTrue:[
		| packageDir shellDir |
		
		packageDir := Smalltalk getPackageDirectoryForPackage: self class package.
		(packageDir notNil and: [packageDir exists]) ifTrue:[
			shellDir := packageDir / '..' / '..' / 'shell'.
			shellDir isDirectory ifTrue:[ 
				^shellDir.
			].
		].
		^nil
	].
	Smalltalk isPharo ifTrue:[
		| slash package repo shellDir |

		slash := #DiskStore asClass activeClass delimiter.
		package := self package name.
		repo := #IceRepository asClass registry
						detect:[ :each | each loadedPackages contains: [:icep | icep name = package ] ]
						ifNone:[ ^nil ].
		shellDir := repo location / 'shell'.
		shellDir isDirectory ifTrue:[ 
			^shellDir.
		].
		^nil
	].
	self error:'Unsupported dialect'.
	^nil.
	
	"
	TRCompilationTestShell shellDirectory
	"
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
	| shellDir |
	
	shellDir := self class shellDirectory.	
	self assert: shellDir notNil description:'Could not determine directory with test shells!'.

	binary := shellDir / ('shell-' , (target name readStream upTo: $-)).
	self assert: binary isExecutable.
]

{ #category : #'running-private' }
TRCompilationTestShell >> setUpDebuggerOnHost: host port: port [
	(Smalltalk includesKey: #GDBDebugger) ifTrue:[
		"Use LibGDBs if available..."
		
		debugger := (Smalltalk at: #GDBDebugger) new.
		debugger executable: binary.
		debugger send: 'target remote ', host , ':' , port printString.
		^self
	] ifFalse:[
		"...else use SmallRSP."
	
		self assert: (Smalltalk includesKey: #RemoteGDB).

		debugger := (Smalltalk at: #RemoteGDB) host: host port: port.
		^self.
	].
]

{ #category : #running }
TRCompilationTestShell >> tearDown [
	self tearDownDebugger 
]

{ #category : #'running-private' }
TRCompilationTestShell >> tearDownDebugger [
	(debugger class name = #GDBDebugger) ifTrue:[
		"debugger is LibGDBs' GDBDebugger..."
		
		(debugger notNil and: [ debugger isConnected ]) ifTrue: [
			| shouldQuitDebugger |
			
			debugger send: 'kill'.
			
			shouldQuitDebugger := (Smalltalk includesKey: #VDBDebuggerApplication) not 
														or:[(Smalltalk at: #VDBDebuggerApplication) allInstances allSatisfy:[:vdbApp | vdbApp debugger ~~ target]].
			shouldQuitDebugger ifTrue: [ 
					debugger send: 'quit' andWait: false.				
			].
		].		
	] ifFalse:[
		"debugger is either nil or SmallRSP's RemoteGDB"
		debugger notNil ifTrue:[		
			debugger disconnect.
		].
	].
	debugger := nil.
]
