"
`TRCodeCache` is a simple code cache implementation, managing
one continguous memory chunk to store code objects (results of
Tinyrossa compilation) for later executiuon.

To store a result of compilation, use #`add:symbol:`

	codeCache add: compilation codeBuffer symbol: compilation functionSymbol.

Downstream project may need to provide customized implementations
of code cache fitting the needs of particular runtime. This class
serves example implementation and it is used in tests (see
class `TRCompilationTestShell`)

"
Class {
	#name : #TRCodeCache,
	#superclass : #Object,
	#instVars : [
		'runtime',
		'base',
		'size',
		'memory',
		'codeAllocPtr',
		'symbols',
		'pending'
	],
	#category : #'Tinyrossa-Runtime-Code Cache'
}

{ #category : #'instance creation' }
TRCodeCache class >> runtime: runtime base: base size: size memory: memory [
	^ self basicNew initializeWithRuntime: runtime base: base size: size memory: memory
]

{ #category : #'adding & removing' }
TRCodeCache >> add: codeObj [
	"Add and link code object for given symbol into the cache"

	| start end exports relocations |

	"1. Allocate memory for the code."
	start := self allocCode: codeObj size.
	end := start + codeObj size.

	"2. relocate the code and exported symbols to assigned address."
	exports := codeObj exports.
	codeObj relocateTo: start with: nil.
	codeObj labels keysAndValuesDo: [ :symbol :addr |
		(exports includes: symbol) ifTrue: [ symbol setAddress: addr ]
	].

	"3. Flush instructions into memory."
	memory replaceFrom: start to: end - 1 with: codeObj bytes startingAt: 1.

	"4. Link (try to resolve relocations)"
	"Resolve object's own exports"
	exports do: [:symbol | self resolve: symbol ].
	"Make sure relocations refer to symbols from local symbol table,
	 this simplifies #fixup: as we do not need to always lookup (resolved)
	 symbols in local symbol table."
	relocations := codeObj relocations.
	relocations do: [:r|r symbol: (self resolve: r symbol)].

	"Finally perform linking step, going over all pending relocations
	 and fixing up code. Note that #fixup: removes the relocation from
	 `pending` after it fixes up the code."
	pending addAll: relocations.
	pending copy do: [:each | self fixup: each ].
]

{ #category : #private }
TRCodeCache >> allocCode: codeSize [
	| codeStart |

	self assert: (codeAllocPtr + codeSize) < (base + size).

	codeStart := codeAllocPtr.
	codeAllocPtr := codeAllocPtr + codeSize.
	^ codeStart.
]

{ #category : #accessing }
TRCodeCache >> bytes [
	"Return a bytearray with binary code."

	^ memory copyFrom: base to: codeAllocPtr.
]

{ #category : #linking }
TRCodeCache >> fixup: relocation [
	"Perform given relocation if relocation's symbol
	 is resolved. If not, no-op."

	self assert: (pending includes: relocation).
	relocation symbol address notNil ifTrue: [
		relocation fixupBinaryCode: memory finalAddress: relocation symbol address.
		pending remove: relocation.
	].
]

{ #category : #initialization }
TRCodeCache >> initializeWithRuntime: runtimeArg base: baseArg size: sizeArg memory: memoryArg [
	self assert: (baseArg isInteger and: [ baseArg >= 0 ]).
	self assert: (sizeArg isInteger and: [ sizeArg >  0 ]).

	runtime := runtimeArg.
	base := baseArg.
	size := sizeArg.
	memory := memoryArg.

	codeAllocPtr := base.
	symbols := Set new.
	pending := Set new.
]

{ #category : #inspecting }
TRCodeCache >> inspector2TabMachineCode [
	<inspector2Tab>

	| isa |

	(Smalltalk includesKey: #VDBInstructionListApplication) ifFalse: [
		"VDB not loaded, try to load it"
		PackageLoadError ignoreIn: [ Smalltalk loadPackage: 'jv:vdb' ].

		(Smalltalk includesKey: #VDBInstructionListApplication) ifTrue: [
			"  Still not loaded, give up."
			^ nil
		].
	].

	runtime target name = 'powerpc64le-linux' ifTrue: [
		isa := AcProcessorDescriptions powerpc64
	] ifFalse: [
	runtime target name = 'riscv64-linux' ifTrue: [
		isa := AcProcessorDescriptions riscv64
	] ifFalse: [
		^ nil.
	]].

	^ (self newInspector2Tab)
		label:'Machine Code';
		priority:50;
		"  view: [ ... ];"
		application: [
			| insns |

			insns := self instructions collect: #asGDBInstruction.
			insns first propertyAt: #address put: base.

			#VDBInstructionListApplication asClass new instructionList: insns.
		];
		"  text: [ ... ];"
		yourself
]

{ #category : #accessing }
TRCodeCache >> instructions [
	"Return code as a sequence of AcInstructions."

	| isa insns |

	"Uf, following is rather ugly..."

	runtime target name = 'powerpc64le-linux' ifTrue: [
		isa := AcProcessorDescriptions powerpc64
	] ifFalse: [
	runtime target name = 'riscv64-linux' ifTrue: [
		isa := AcProcessorDescriptions riscv64
	] ifFalse: [
		self error: 'Unsupported target: ', runtime target name
	]].

	insns := isa decode: self bytes.

	^ insns
]

{ #category : #private }
TRCodeCache >> memory [
	^ memory
]

{ #category : #linking }
TRCodeCache >> resolve: symbol [
	"Given a `symbol`, look it up in local symbol table
	 and try to resolve it. Return the local symbol.

	 By 'resolving' we mean finding out its (final) address.
	"

	| local |

	"Lookup this symbol in local symbol table, adding it if mussing."
	local := symbols detect: [:each | each = symbol] ifNone: [ symbols add: symbol ].

	"Update symbol address if known."
	(local address isNil and:[ symbol address notNil ]) ifTrue: [
		local setAddress: symbol address.
	].

	^ local
]
