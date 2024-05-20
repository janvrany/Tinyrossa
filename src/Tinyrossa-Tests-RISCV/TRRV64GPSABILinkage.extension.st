Extension { #name : #TRRV64GPSABILinkage }

{ #category : #'*Tinyrossa-Tests-RISCV' }
TRRV64GPSABILinkage >> parameterRegisters: kind [
	"Return (ordered) list of parameter registers of given kind.

	 Note, that this method is used by tests only, compiler
	 does not use it."

	^ self parameterRegisters select: [:r | r kind = kind ]
]

{ #category : #'*Tinyrossa-Tests-RISCV' }
TRRV64GPSABILinkage >> returnRegisters: kind [
	"Return (ordered) list of return registers of given kind.

	 Note, that this method is used by tests only, compiler
	 does not use it."

	^ { a0 . a1 } select: [:r | r kind = kind ]
]
