Extension { #name : #TRCompilationTarget }

{ #category : #'*Tinyrossa-Tests' }
TRCompilationTarget >> gem5 [
	"Return name of Gem5 architecture suitable for running programs for this target.

	 For example, for RISC-V return `RISCV`,
				  for PowerPC 64 return `POWER`,
				  for AArch64 return `ARM`.

	 See class TRCompilationTestShellGem5
	"

	^ self subclassResponsibility
]

{ #category : #'*Tinyrossa-Tests' }
TRCompilationTarget >> qemu [
	"Return name of QEMU suitable for running programs for this target."

	^ self subclassResponsibility
]
