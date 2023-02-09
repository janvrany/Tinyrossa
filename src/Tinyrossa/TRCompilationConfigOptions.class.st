Class {
	#name : #TRCompilationConfigOptions,
	#superclass : #SharedPool,
	#classVars : [
		'OptionAOT',
		'OptionLinkage',
		'OptionObjectFile',
		'OptionRegisterAllocator',
		'OptionTarget'
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
]
