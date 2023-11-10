Class {
	#name : #TRCompilationConfigOptions,
	#superclass : #TRSharedPool,
	#classVars : [
		'OptionAOT',
		'OptionLinkage',
		'OptionObjectFile',
		'OptionOptimizationPasses',
		'OptionRegisterAllocator',
		'OptionStressRA',
		'OptionTarget',
		'OptionVerifyAfterEachOptimizationPass'
	],
	#category : #'Tinyrossa-Config'
}

{ #category : #initialization }
TRCompilationConfigOptions class >> initialize [

	OptionTarget := #Target.
	OptionLinkage := #Linkage.
	OptionRegisterAllocator := #RegisterAllocator.
	OptionAOT := #OptionAOT.
	OptionObjectFile := #OptionObjectFile.
	OptionVerifyAfterEachOptimizationPass := #OptionVerifyAfterEachOptimizationPass.
	OptionOptimizationPasses := #OptionOptimizationPasses.
	OptionStressRA := #OptionStressRA
]
