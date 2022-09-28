Extension { #name : #TRCompilationConfig }

{ #category : '*Tinyrossa-RISCV' }
TRCompilationConfig class >> forRV64G [
	^ self new
		codeGeneratorClass: TRRV64GCodeGenerator;
		linkageClass: TRRV64GPSABILinkage;
		yourself.
]
