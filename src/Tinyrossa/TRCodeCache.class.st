"
`TRCodeCache` is a simple code cache implementation, managing
one continguous memory chunk to store code objects (results of
Tinyrossa compilation) for later executiuon.

To store a result of compilation use #`add:`

	codeCache add: compilation codeBuffer

To add (and link to) an external symbol (that is, a symbol located
outside the code cache) use `#addSymbol:`

	codeCache addSymbol: externalSymbol

The (external) symbol must be ""resolved"", i.e., it must have
an `#address` set.

Downstream project may need to provide customized implementations
of code cache fitting the needs of particular runtime. This class
serves example implementation and it is used in tests (see
class `TRCompilationTestShell`)

See also `TRCodeCacheManager`.

"
Class {
	#name : #TRCodeCache,
	#superclass : #Object,
	#instVars : [
		'runtime',
		'manager',
		'base',
		'size',
		'sizeOfGOTentry',
		'memory',
		'codeAllocPtr',
		'goteAllocPtr',
		'linker',
		'exports',
		'symbols',
		'relocations',
		'pending'
	],
	#pools : [
		'TRDataTypes'
	],
	#category : #'Tinyrossa-Runtime-Code Cache'
}

{ #category : #'instance creation' }
TRCodeCache class >> runtime: runtime base: base size: size memory: memory [
	^ self basicNew initializeWithRuntime: runtime base: base size: size memory: memory
]

{ #category : #'adding & removing' }
TRCodeCache >> add: codeObj [
	"Add and link code object into the cache"

	| start end labels |

	"1. Allocate memory for the code."
	start := self allocCode: codeObj size.
	end := start + codeObj size.

	"2. relocate the code."
	codeObj relocateTo: start with: nil.
	(labels := codeObj labels) keysAndValuesDo: [ :symbol :addr |
		self assert:(addr between: base and: base + size - 1).
	].

	"3. Flush instructions into memory."
	memory replaceFrom: start to: end - 1 with: codeObj bytes startingAt: 1.

	"4. Link (fixup relocations to already resolved symbols)"
	codeObj exports keysAndValuesDo: [ :symbol :addr |
		| symbolToAdd |

		self assert: symbol isTRStaticSymbol.
		self assert:(symbols keys contains: [:each | each name = symbol name]) not.
		self assert:(addr between: base and: base + size - 1).

		symbolToAdd := symbol copy.
		symbolToAdd setAddress: addr.

		exports add: symbolToAdd.
		symbols at: symbolToAdd put: addr.

		"See below why this is necessary"
		labels removeKey: symbol ifAbsent: [ ].
	].
	codeObj relocations keysAndValuesDo: [:reloc :addr |
		| relocToAdd |

		self assert: reloc isAcRelocation.
		self assert:(addr between: base and: base + size - 1).

		"Following is needed to support R_RISCV_PCREL_L012 relocations. The symbol associated
		 with this type of relocation points to corresponding R_RISCV_*_HI20 relocation.
		 This is isually just label that is not exported. So, if we found a relocation
		 pointing to (local) label, we add that label to list of symbols.

		 To avoid clashes possible name clashes (label names are only unique with one
		 compilation unit), we rename the symbol and copy the relocation (as not to
		 modify the original object)."

		relocToAdd := reloc.
		(labels includesKey: reloc symbol) ifTrue: [
			| symbolToAddAddr symbolToAdd |

			self assert: reloc symbol isTRLabelSymbol.

			symbolToAddAddr := labels at: reloc symbol.

			symbolToAdd := reloc symbol class name: ('.LL_0x' , (symbolToAddAddr printLeftPaddedWith: $0 to: 8 base: 16)).
			symbolToAdd setAddress: symbolToAddAddr.

			relocToAdd := reloc class symbol: symbolToAdd addend: reloc addend.

			self assert:(symbols keys contains: [:each | each name = symbolToAdd name]) not.

			symbols at: symbolToAdd put: symbolToAddAddr
		].
		relocations at: relocToAdd put: addr.
		pending add: relocToAdd.
	].
	self link.

	"
	5. Inform manager (if any) that new exports have been added
	"
	manager notNil ifTrue: [ 
		codeObj exports keys do: [:export | 
			manager addSymbol: (symbols elementAt: export) segment: self
		].
	].
]

{ #category : #'adding & removing' }
TRCodeCache >> addSymbol: aTRStaticSymbol [
	self assert: aTRStaticSymbol isTRStaticSymbol.
	self assert: aTRStaticSymbol address isInteger.
	self assert:(aTRStaticSymbol address between: base and: base + size) not.
	self assert:(symbols keys contains: [:each | each name = aTRStaticSymbol name]) not.

	symbols at: aTRStaticSymbol put: aTRStaticSymbol address.
	self link.
]

{ #category : #private }
TRCodeCache >> allocCode: codeSize [
	| codeStart |

	self assert: (codeAllocPtr + codeSize) < goteAllocPtr.

	codeStart := codeAllocPtr.
	codeAllocPtr := codeAllocPtr + codeSize.
	^ codeStart.
]

{ #category : #private }
TRCodeCache >> allocGOTentry [
	| addr |

	self assert: codeAllocPtr < (goteAllocPtr - sizeOfGOTentry).

	addr := goteAllocPtr.
	goteAllocPtr := goteAllocPtr - sizeOfGOTentry.
	^ addr.
]

{ #category : #accessing }
TRCodeCache >> bytes [
	"Return a bytearray with binary code."

	^ memory copyFrom: base to: codeAllocPtr - 1.
]

{ #category : #accessing }
TRCodeCache >> exports [
	"Return a map (Dictionary) mapping all exported symbols)
	 to their corresponding addresses.
	"

	| exportMap |

	exportMap := Dictionary new: exports size.
	exports do: [:symbol | 
		exportMap at: symbol put: (symbols at: symbol)
	].
	^ exportMap
]

{ #category : #private }
TRCodeCache >> getGOTentryFor: aTRStaticSymbol [
	| entry |

	self assert: aTRStaticSymbol isTRStaticSymbol.
	self assert:(symbols includesKey: aTRStaticSymbol).

	entry := aTRStaticSymbol got.
	^ symbols elementAt: entry ifAbsent: [
		entry setAddress: self allocGOTentry.

		sizeOfGOTentry == 4 ifTrue: [
			memory unsignedLongAt: entry address put: (symbols at: aTRStaticSymbol) bigEndian: runtime target endian isBig.
		] ifFalse: [
		sizeOfGOTentry == 8 ifTrue: [
			memory unsignedLongLongAt: entry address put: (symbols at: aTRStaticSymbol) bigEndian: runtime target endian isBig.
		] ifFalse: [
			self assert: false description: 'Unsupported GOT entry size'
		]].

		symbols at: entry put: entry address.
		entry.
	]
]

{ #category : #private }
TRCodeCache >> getPLTentryFor: aTRFunctionSymbol [
	| trampoline |

	self assert: aTRFunctionSymbol isTRFunctionSymbol.
	self assert:(symbols includesKey: aTRFunctionSymbol).

	trampoline := aTRFunctionSymbol plt.
	^ symbols elementAt: trampoline ifAbsent: [
		| trampolineObj |

		self halt.
		"createTrampoline: is not yet implemented. This has to dispatch back
		 to the linkage of `aTRFunctionSymbol` because that's the only object which
		 knows the (main) call sequence as well as which registers are safe to
		 trash and which not.

		 The trouble is, to instantiate linkage we need full compilation...
		 Sigh."
		trampolineObj := runtime createTrampoline: aTRFunctionSymbol.
		self add: trampolineObj.

		trampoline
	]
]

{ #category : #inspecting }
TRCodeCache >> gtInspectorInstructionsIn: composite [
	<gtInspectorPresentationOrder: 50>

	"On Smalltalk/X we use VDB instruction view"
	Smalltalk isSmalltalkX ifTrue: [ ^ self ].

	^ composite fastTable
		title: 'Instructions';
		display: [ 
			| instructions pc insnsWithAddrs |

			instructions := self instructions.
			pc := base.
			insnsWithAddrs := OrderedCollection new: instructions size.
			instructions do:[:insn |
				insnsWithAddrs add: { insn . pc }.
				pc := pc + (insn bitWidth // 8)
			].
			insnsWithAddrs
		];
		column: 'Address' evaluated: [ :insnAndAddr | insnAndAddr second        printPaddedWith: $0 to: 6 base: 16  ];
		column: 'Instruction' evaluated: [ :insnAndAddr | insnAndAddr first disassemble ];
		yourself
]

{ #category : #inspecting }
TRCodeCache >> gtInspectorRelocationsIn: composite [
	<gtInspectorPresentationOrder: 40>

	composite fastTable 
			title: 'Relocations';
			display: [ :ignored | relocations keys asArray ];
			column: 'Type' evaluated: [ :rel | rel class name  ];
			column: 'Address' evaluated: [ :rel | '0x' , (relocations at:rel) hex ];
			column: 'Symbol' evaluated: [ :rel | rel symbol name  ];
			column: 'Addend' evaluated: [ :rel | rel addend  ];
			yourself.
]

{ #category : #inspecting }
TRCodeCache >> gtInspectorSymbolsIn: composite [
	<gtInspectorPresentationOrder: 50>

	composite fastTable 
			title: 'Symbols';
			display: [ :ignored | 
				| all |

				all := symbols keys.
				pending do: [:rel | (symbols includesKey: rel symbol) ifFalse:[all add: rel symbol ] ].
				all asArray ];
			column: 'Name' evaluated: [ :sym | sym name ];
			column: 'Kind' evaluated: [ :sym | (exports includes: sym) ifTrue:['E'] ifFalse:[(symbols includesKey:sym) ifTrue:[''] ifFalse:['U']] ];            
			column: 'Address' evaluated: [ :sym | (symbols includesKey: sym) ifTrue:[ '0x' , (symbols at: sym) hex ] ifFalse:[''] ];
			yourself.
]

{ #category : #initialization }
TRCodeCache >> initializeWithRuntime: runtimeArg base: baseArg size: sizeArg memory: memoryArg [
	self assert: (baseArg isInteger and: [ baseArg >= 0 ]).
	self assert: (sizeArg isInteger and: [ sizeArg >  0 ]).

	runtime := runtimeArg.
	base := baseArg.
	size := sizeArg.
	sizeOfGOTentry := runtime target sizeInBytesOf: Address.
	memory := memoryArg.

	codeAllocPtr := base.
	goteAllocPtr := base + size - sizeOfGOTentry.

	manager := nil.
	exports := Set new.
	symbols := Dictionary new.
	relocations := Dictionary new.
	pending := Set new.
]

{ #category : #accessing }
TRCodeCache >> instructions [
	"Return code as a sequence of AcInstructions."

	| isa insns addr2symMap addr2relMap insnAddr |

	"Uf, following is rather ugly..."

	runtime target name = 'powerpc64le-linux' ifTrue: [
		isa := AcProcessorDescriptions powerpc64
	] ifFalse: [
	runtime target name = 'riscv64-linux' ifTrue: [
		isa := AcProcessorDescriptions riscv64
	] ifFalse: [
		self error: 'Unsupported target: ', runtime target name
	]].


	"1. Decode instructions from memory."
	[
		insns := isa decode: self bytes.
		"Sigh, #decode: return a single instruction if there's only
		 one instruction in giben bytes."
		insns isCollection ifFalse: [
			insns := OrderedCollection with: insns.
		].
	] on: IllegalInstruction do: [:ex |
		ex encoding length == 32 ifTrue: [
			ex proceedWith: (AcInt32 value: ex encoding)
		].
		ex pass.
	].

	"2. Walk over instructions and inject symbols and relocations"
	addr2symMap := Dictionary new: symbols size.
	symbols keysAndValuesDo: [ :sym :addr | addr2symMap at: addr put: sym ].

	addr2relMap := Dictionary new: relocations size.
	relocations keysAndValuesDo: [ :rel :addr | addr2relMap at: addr put: rel ].

	insnAddr := codeAllocPtr.
	insns size to: 1 by: -1 do: [:insnIndex |
		| insn sym rel |

		insn := insns at: insnIndex.
		insnAddr := insnAddr - (insn bitWidth // 8).
		sym := addr2symMap at: insnAddr ifAbsent: [ nil ].
		sym notNil ifTrue: [
			insns add: (AcLabel symbol: sym) beforeIndex: insnIndex.
		].
		rel := addr2relMap at: insnAddr ifAbsent: [ nil ].
		rel notNil ifTrue: [
			insn relocation: rel
		].
	].
	self assert: insnAddr == base.

	^ insns
]

{ #category : #private }
TRCodeCache >> link [
	"Perform linking step: go over all unprocessed relocations
	 and process them if the final address of the symbol is
	 known."

	pending copy do: [:reloc |
		(symbols includesKey: reloc symbol) ifTrue: [
			[
				reloc fixup: memory symbols: symbols relocations: relocations.
				pending remove: reloc.
			]  on: AcRelocationSymbolUnresolved do: [:ex |
				"Ignore, might get resolved later."
			] on: AcRelocationRequestGOTEntry do: [:req |
				| entry |

				entry := self getGOTentryFor: req symbol.
				req resume: entry -> entry address.
			] on: AcRelocationRequestPLTEntry do: [:req |
				| entry |

				entry := self getPLTentryFor: req symbol.
				req resume: entry -> entry address.
			].
		].
	].
]

{ #category : #private }
TRCodeCache >> manager: aTRCodeCacheManager [
	manager := aTRCodeCacheManager.
]

{ #category : #accessing }
TRCodeCache >> runtime [
	^ runtime
]
