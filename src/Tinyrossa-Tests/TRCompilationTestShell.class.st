Class {
	#name : #TRCompilationTestShell,
	#superclass : #TestAsserter,
	#instVars : [
		'compilation',
		'binary',
		'debugger'
	],
	#classVars : [
		'DefaultImpl'
	],
	#pools : [
		'TRRegisterKinds'
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
TRCompilationTestShell class >> forCompilation: aTRCompilation [
	self == TRCompilationTestShell ifTrue: [ 
		^ self defaultImpl forCompilation: aTRCompilation
	] ifFalse: [ 
		^ self new initializeWithCompilation: aTRCompilation
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

{ #category : #utilities }
TRCompilationTestShell >> call [
	^ self callWithArguments: #()
]

{ #category : #utilities }
TRCompilationTestShell >> call: arg1 [
	^ self callWithArguments: { arg1 }
]

{ #category : #utilities }
TRCompilationTestShell >> call: arg1 _:arg2 [
	^ self callWithArguments: { arg1 . arg2 }
]

{ #category : #'utilities-private' }
TRCompilationTestShell >> callWithArguments: values [
	| params |

	"Inject compiled code into shell"
	debugger memoryAt: self nzone put: compilation codeBuffer bytes.

	"Prepare parameters"
	params := (compilation symbolManager lookupSymbolsByType: TRParameterSymbol) sorted: [ :a :b | a index < b index ].
	self assert: values size == params size description: 'Number of formal paramerers does not match actual'.
	1 to: values size do: [:i |
		| param value |

		param := params at: i.
		value := values at: i.

		param type validateConstant: value.

		param type isIntegerType ifTrue: [
			| argReg |

			argReg := (compilation codegen linkage parameterRegisters: GPR) at: i.
			debugger setRegister: argReg nameInGDB to: value.
		] ifFalse: [
			self error: 'Parameter type not supported yet: ' , param type name
		].
	].

	"Call injected function"
	"
	VDBDebuggerApplication openFor: debugger
	"
	debugger c.

	"Retrieve return value"
	compilation functionSymbol type isIntegerType ifTrue: [
		| retReg |

		retReg := (compilation codegen linkage returnRegisters: GPR) at: 1.
		^ debugger getRegister: retReg nameInGDB
	] ifFalse: [
		self error: 'Return type not supported yet: ' , compilation functionSymbol type name
	].
]

{ #category : #accessing }
TRCompilationTestShell >> debugger [
	self assert: debugger notNil.
	^ debugger
]

{ #category : #initialization }
TRCompilationTestShell >> initializeWithCompilation: aTRCompilation [
	compilation := aTRCompilation.
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

	binary := shellDir / ('shell-' , (compilation config target name readStream upTo: $-)).
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
														or:[(Smalltalk at: #VDBDebuggerApplication) allInstances allSatisfy:[:vdbApp | vdbApp debugger ~~ debugger]].
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
