Extension { #name : #TRCompilationTarget }

{ #category : #'*Tinyrossa-Tests' }
TRCompilationTarget >> qemu [
	"Return name of QEMU suitable for running programs for this target."

	^ self subclassResponsibility
]
