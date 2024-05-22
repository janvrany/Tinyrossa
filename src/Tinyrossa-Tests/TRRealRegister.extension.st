Extension { #name : #TRRealRegister }

{ #category : #'*Tinyrossa-Tests' }
TRRealRegister >> nameInGDB [
	"Return name of the register as used by GDB.

	To be overriden in custom subclasses for some architectures
	where register names used by Tinyrossa and/or ArchC differ (POWER)."

	^ value name
]
