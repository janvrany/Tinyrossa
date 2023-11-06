Class {
	#name : #TRPPC64PSABILinkage,
	#superclass : #TRLinkage,
	#instVars : [
		'frameSize',
		'fprSaveAreaOffset',
		'fprSaveAreaSize',
		'gprSaveAreaOffset',
		'gprSaveAreaSize',
		'vectorSaveAreaOffset',
		'vectorSaveAreaSize',
		'localVariableSpaceOffset',
		'localVariableSpaceSize',
		'parameterSaveAreaSize'
	],
	#classVars : [
		'BackChainOffset',
		'CRSaveWordOffset',
		'LRSaveDoublewordOffset',
		'ParameterSaveAreaOffset',
		'TOCPointerDoublewordOffset'
	],
	#pools : [
		'TRDataTypes',
		'TRPPC64Registers'
	],
	#category : #'Tinyrossa-POWER-Codegen'
}

{ #category : #initialization }
TRPPC64PSABILinkage class >> initialize [
	"
	See 64-bit ELF V2 ABI Specification, Power Architecture, Revision 1.5.
		Section 2.2.3
		https://openpowerfoundation.org/specifications/64bitelfabi/    
	"
	BackChainOffset := 0.
	CRSaveWordOffset := 8.
	LRSaveDoublewordOffset := 16.
	TOCPointerDoublewordOffset := 24.
	ParameterSaveAreaOffset := 32.
]

{ #category : #accessing }
TRPPC64PSABILinkage >> allocatableRegisters [
	^ self preservedRegisters reversed
]

{ #category : #'code generation' }
TRPPC64PSABILinkage >> generateCall: node [
	"superclass TRLinkage says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #'code generation' }
TRPPC64PSABILinkage >> generateEpilogue: valReg [
	"Move value to ABI return register..."
	generate
		mr: gr4, valReg.

	"Restore preserved registers"
	self preservedRegisters do: [:reg |
		(self allocatedRegisters includes: reg) ifTrue: [ 
			| offset |

			offset := gprSaveAreaOffset + ((32 - reg value - 1) * 8).
			generate ld: reg, (gr1 + offset).
		].
	].

	"Destroy the frame, reload link register and return"    
	generate
		addi: gr1, gr1, frameSize;
		ld: gr0, (gr1 + 16);
		mtlr: gr0;
		blr.
]

{ #category : #'code generation' }
TRPPC64PSABILinkage >> generatePrologue [
	| parameters parameterTypes parameterMappings |
	"Save backchain, CR and LR (no need for TOC as we're not messing with it.)"

	generate
		mflr: gr0;
		std: gr0, (gr1 + 16);
		stdu: gr1, (gr1 - frameSize).

	"Save parameters"
	parameters := codegen compilation symbolManager lookupSymbolsByType: TRParameterSymbol.
	parameters := parameters sorted: [ :a :b | a index < b index ].
	parameterTypes := parameters collect: [ :parameter | parameter type ].
	parameterMappings := self mapParameters: parameterTypes.
	1 to: parameters size do: [:i |
		| param type reg |

		param := parameters at: i.
		type := parameterTypes at: i.
		reg := parameterMappings at: i.

		type == Int64 ifTrue: [ 
			generate std: reg, (gr1 + param offset).
		] ifFalse: [ 
		type == Int32 ifTrue: [ 
			generate stw: reg, (gr1 + param offset).
		] ifFalse: [ 
			self error: 'Parameter type ', type name , ' not yet supported'.
		]].
	]. 

	"Save preserved registers"
	self preservedRegisters do: [:reg |
		(self allocatedRegisters includes: reg) ifTrue: [ 
			| offset |

			offset := gprSaveAreaOffset + ((32 - reg value - 1) * 8).
			generate std: reg, (gr1 + offset).
		].
	].
]

{ #category : #'code generation' }
TRPPC64PSABILinkage >> generateReturn: node [
	| srcReg |

	self assert: codegen compilation functionType == node child1 type.

	srcReg := codegen evaluator evaluate: node child1.
	generate leave: srcReg.   

	^ nil
]

{ #category : #mapping }
TRPPC64PSABILinkage >> mapParameters: parameterTypes [ 
	"Map parameters to argument registers.

	 Return a Dictionary mapping parameter to either
	  * machine register if parameter is passed in register
	  * stack offset relative to *caller's* SP if parameter
		is passed on stack."
	
	| parameterMapping |

	parameterMapping := Array new: parameterTypes size.
	parameterTypes withIndexDo: [:type :index | 
		"For now, only up to 8 integer parameters are supported."
		self assert: type isIntegerType.
		self assert: index <= self parameterRegisters size.
		parameterMapping at: index put: (self parameterRegisters at: index)
	].
	^ parameterMapping
]

{ #category : #mapping }
TRPPC64PSABILinkage >> mapStack [
	"Compute frame size and map parameters, automatics 
	 and spills to stack slots.

	 See 64-bit ELF V2 ABI Specification, Power Architecture, Revision 1.5.
		 Section 2.2.3
		 https://openpowerfoundation.org/specifications/64bitelfabi/
	"
	| lowestAllocatedGPR automatics parameters offset |

	fprSaveAreaSize := 0. "TODO: Bogus, but we do not yet support floating point!"

	"
	General-Purpose Register Save Area

	If a function changes the value in any nonvolatile general-purpose register rN, it shall first save the
	value in rN in the General-Purpose Register Save Area and restore the register upon function exit.
	If full unwind information such as DWARF is present, registers can be saved in arbitrary locations in
	the stack frame. If the system general-purpose register save and restore functions are to be used,
	the general-purpose registers shall be saved in a contiguous range. General-purpose register rN is
	saved in the doubleword located 8 x (32 – N) bytes before the Floating-Point Register Save Area, as
	shown in Figure 2.18, “Stack Frame Organization” [34].

	The General-Purpose Register Save Area is always doubleword aligned. The size of the General-
	Purpose Register Save Area depends upon the number of general registers that must be saved. If
	no general-purpose registers are to be saved, the General-Purpose Register Save Area has a zero
	size.
	"
	lowestAllocatedGPR := self allocatedRegisters detectMin: #value.
	gprSaveAreaSize := 8 * (32 - lowestAllocatedGPR value).

	vectorSaveAreaSize := 0. "TODO: Bogus, but we do not yet support vector regiters!"

	automatics := codegen compilation symbolManager lookupSymbolsByType: TRAutomaticSymbol.
	automatics := automatics select: [:e | e isUsed ].
	localVariableSpaceSize := 8 * automatics size.

	parameters := codegen compilation symbolManager lookupSymbolsByType: TRParameterSymbol.
	parameterSaveAreaSize := 8 * parameters size.


	"Now, compute frame size and offsets to various areas."
	localVariableSpaceOffset := ParameterSaveAreaOffset + parameterSaveAreaSize.
	vectorSaveAreaOffset := localVariableSpaceOffset + localVariableSpaceSize.
	gprSaveAreaOffset := vectorSaveAreaOffset + vectorSaveAreaSize + ((fprSaveAreaSize + gprSaveAreaSize) \\ 16).
	fprSaveAreaOffset := gprSaveAreaOffset + gprSaveAreaSize.

	frameSize := fprSaveAreaOffset + fprSaveAreaSize.

	"Finally, map automatics and parameters to slots in respective
	 areas."
	offset := ParameterSaveAreaOffset.
	parameters do: [:parameter | 
		parameter setOffset: offset.
		offset := offset + 8.
	].

	offset := localVariableSpaceOffset.
	automatics do: [:automatic | 
		automatic setOffset: offset.
		offset := offset + 8.
	].
]

{ #category : #accessing }
TRPPC64PSABILinkage >> parameterRegisters [
	^ { gr4 . gr5 . gr6 . gr7 . gr8 . gr9 . gr10 }
]

{ #category : #accessing }
TRPPC64PSABILinkage >> preservedRegisters [
	^ { gr14 . gr15 . gr16 . gr17 . gr18 . gr19 . gr20 . gr21 . gr22 . gr23 . gr24 . gr25 . gr26 . gr27 . gr28 . gr29 . gr30 . gr31 }
]
