Extension { #name : #TRLinkage }

{ #category : #'*Tinyrossa-Tests' }
TRLinkage >> parameterRegisters: kind [
	"Return (ordered) list of parameter registers of given kind.

	 Note, that this method is used by tests only, compiler
	 does not use it."

	^ self subclassResponsibility
]

{ #category : #'*Tinyrossa-Tests' }
TRLinkage >> returnRegisters: kind [
	"Return (ordered) list of return registers of given kind.

	 Note, that this method is used by tests only, compiler
	 does not use it."

	^ self subclassResponsibility
]
