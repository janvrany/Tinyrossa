Extension { #name : #TRCompilationTarget }

{ #category : #'*Tinyrossa-Tests' }
TRCompilationTarget >> gem5 [
	"Return name of gem5 architecture, i.e.,  RISCV for RISC-V, POWER for PowerPC and so on."

	^ self subclassResponsibility
]

{ #category : #'*Tinyrossa-Tests' }
TRCompilationTarget >> qemu [
	"Return name of QEMU suitable for running programs for this target."

	^ self subclassResponsibility
]
