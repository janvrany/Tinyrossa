Extension { #name : #TRCompilationConfig }

{ #category : #'*Tinyrossa-RISCV' }
TRCompilationConfig class >> forRV64GLinux [
	^ self forTarget: TRRV64GLinux default
]
