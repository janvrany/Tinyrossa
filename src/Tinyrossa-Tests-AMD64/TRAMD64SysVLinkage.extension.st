Extension { #name : #TRAMD64SysVLinkage }

{ #category : #'*Tinyrossa-Tests-AMD64' }
TRAMD64SysVLinkage >> parameterRegisters: kind [
	"Return (ordered) list of parameter registers of given kind.

	 Note, that this method is used by tests only, compiler
	 does not use it."

	^ self parameterRegisters select: [:r | r kind = kind ]
]

{ #category : #'*Tinyrossa-Tests-AMD64' }
TRAMD64SysVLinkage >> returnRegisters: kind [
	"Return (ordered) list of return registers of given kind.

	 Note, that this method is used by tests only, compiler
	 does not use it."

	^ { rax } select: [:r | r kind = kind ]
]
