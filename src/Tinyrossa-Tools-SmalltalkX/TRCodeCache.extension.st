Extension { #name : #TRCodeCache }

{ #category : #'*Tinyrossa-Tools-SmalltalkX' }
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
