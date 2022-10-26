Class {
	#name : #TRCompilationConfigOptions,
	#superclass : #SharedPool,
	#classVars : [
		'OptionTarget',
		'OptionLinkage',
		'OptionRegisterAllocator',
		'OptionAOT',
		'OptionObjectFile'
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
