Class {
	#name : #TRCompilationTestShell,
	#superclass : #TestAsserter,
	#instVars : [
		'target',
		'binary',
		'debugger',
		'nzone1Base',
		'nzone1Size',
		'nzone1',
		'heap1Base',
		'heap1Size',
		'heap1',
		'nzone2Base',
		'nzone2Size',
		'nzone2',
		'heap2Base',
		'heap2Size',
		'heap2',
		'entryBase',
		'entrySize'
	],
	#classVars : [
		'DefaultImpl'
	],
	#pools : [
		'TRRegisterKinds'
	],
	#category : #'Tinyrossa-Tests-Shells'
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

	| packageDir shellDir |

	packageDir := Smalltalk getPackageDirectoryForPackage: TRCompilationTestShell package.
	(packageDir notNil and: [packageDir exists]) ifTrue:[
		shellDir := packageDir / '..' / '..' / 'shell'.
		shellDir isDirectory ifTrue:[
			^shellDir.
		].
	].
	^nil

	"
	TRCompilationTestShell shellDirectory
	"
]

{ #category : #accessing }
TRCompilationTestShell >> debugger [
	self assert: debugger notNil.
	^ debugger
]

{ #category : #accessing }
TRCompilationTestShell >> entry [
	"Return the value if (default) entry point in nzone"

	| memory entry |

	memory := debugger selectedInferior memory.

	"BOGUS BOGUS"
	entry := memory unsignedLongLongAt: entryBase bigEndian: false.
	^ entry
]

{ #category : #accessing }
TRCompilationTestShell >> entry: entry [
	"Set the address of entry point in nzone"

	| memory |

	memory := debugger selectedInferior memory.
	"BOGUS BOGUS"
	memory unsignedLongLongAt: entryBase put: entry bigEndian: false.
	^ entry
]

{ #category : #accessing }
TRCompilationTestShell >> heap1 [
	heap1 isNil ifTrue: [
		| runtime |

		runtime := TRRuntime forTarget: target.
		heap1 := TRCodeCache runtime: runtime base: heap1Base size: heap1Size memory: debugger selectedInferior memory.
	].
	^ heap1
]

{ #category : #accessing }
TRCompilationTestShell >> heap2 [
	heap2 isNil ifTrue: [
		| runtime |

		runtime := TRRuntime forTarget: target.
		heap2 := TRCodeCache runtime: runtime base: heap2Base size: heap2Size memory: debugger selectedInferior memory.
	].
	^ heap2
]

{ #category : #initialization }
TRCompilationTestShell >> initializeWithTarget: aTRCompilationTarget [
	target := aTRCompilationTarget.

	"!!! Following must be kept in sync with values in
		 `shell.c` and `shell.link`"
	nzone1Base :=  16r000A0000.
	nzone1Size :=  1024.
	heap1Base  :=  16r000B0000.
	heap1Size  :=  4096.

	nzone2Base := 16r7000C0000.
	nzone2Size := 1024.
	heap2Base  := 16r7000D0000.
	heap2Size  := 4096.

	entryBase  := 16r00090000.
	entrySize  := 8.

	self setUp.
]

{ #category : #utilities }
TRCompilationTestShell >> inject: compilation [
	"Utility: inject compiled code into the shell" 

	self nzone add: compilation codeBuffer
]

{ #category : #utilities }
TRCompilationTestShell >> inject: compilation andInvokeWith: arguments [
	| argumentTypes |

	self inject: compilation.

	argumentTypes := ((compilation symbolManager lookupSymbolsByType: TRParameterSymbol)
							sorted: [ :a :b | a index < b index ])
							collect:[ :e | e type ].

	^ self invoke: compilation functionSymbol with: arguments types: argumentTypes.
]

{ #category : #utilities }
TRCompilationTestShell >> invoke: symbol with: arguments types: argumentTypes [
	| linkage |

	linkage := symbol linkageClass basicNew.

	self assert: arguments size == argumentTypes size description: 'Number of formal paramerers does not match actual'.
	1 to: arguments size do: [:i |
		| typ arg |

		typ := argumentTypes at: i.
		arg := arguments at: i.

		typ validateConstant: arg.

		typ isIntegerType ifTrue: [
			| argReg |

			argReg := (linkage parameterRegisters: GPR) at: i.
			debugger setRegister: argReg nameInGDB to: arg.
		] ifFalse: [
			self error: 'Parameter type not supported yet: ' , typ name
		].
	].
	self debugger setRegister: 'pc' to: (nzone1 exports at: symbol).

	"Call injected function"
	"
	VDBDebuggerApplication openFor: debugger
	"
	debugger c.

	"Retrieve return value"
	symbol type isIntegerType ifTrue: [
		| retReg |

		retReg := (linkage returnRegisters: GPR) at: 1.
		^ debugger getRegister: retReg nameInGDB
	] ifFalse: [
		self error: 'Return type not supported yet: ' , symbol type name
	].
]

{ #category : #accessing }
TRCompilationTestShell >> nzone [
   ^ self nzone1
]

{ #category : #accessing }
TRCompilationTestShell >> nzone1 [
	nzone1 isNil ifTrue: [
		| runtime |

		runtime := TRRuntime forTarget: target.
		nzone1 := TRCodeCache runtime: runtime base: nzone1Base size: nzone1Size memory: debugger selectedInferior memory.
	].
	^ nzone1
]

{ #category : #accessing }
TRCompilationTestShell >> nzone2 [
	nzone2 isNil ifTrue: [
		| runtime |

		runtime := TRRuntime forTarget: target.
		nzone2 := TRCodeCache runtime: runtime base: nzone2Base size: nzone2Size memory: debugger selectedInferior memory.
	].
	^ nzone2
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

			(debugger inferiors anySatisfy: [:e | e isRunning ]) ifTrue: [ 
				debugger send: 'kill'
			].
			
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
