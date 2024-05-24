Class {
	#name : #BaselineOfAsmJit,
	#superclass : #BaselineOf,
	#category : #BaselineOfAsmJit
}

{ #category : #baselines }
BaselineOfAsmJit >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec package: 'AsmJit-Core'.
			spec package: 'AsmJit-Operands'.
			spec package: 'AsmJit-Instructions'.
			spec package: 'AsmJit-Extension'.
			spec package: 'AsmJit-x86'.
			spec package: 'AsmJit-Tests'.
		].
]
