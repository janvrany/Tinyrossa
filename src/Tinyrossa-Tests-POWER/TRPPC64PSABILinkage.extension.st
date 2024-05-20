Extension { #name : #TRPPC64PSABILinkage }

{ #category : #'*Tinyrossa-Tests-POWER' }
TRPPC64PSABILinkage >> parameterRegisters: kind [
	"Return (ordered) list of parameter registers of given kind.

	 Note, that this method is used by tests only, compiler
	 does not use it."

	^ self parameterRegisters select: [:r | r kind = kind ]
]

{ #category : #'*Tinyrossa-Tests-POWER' }
TRPPC64PSABILinkage >> returnRegisters: kind [
	"Return (ordered) list of return registers of given kind.

	 Note, that this method is used by tests only, compiler
	 does not use it."

	^ { gr4 } select: [:r | r kind = kind ]
]
