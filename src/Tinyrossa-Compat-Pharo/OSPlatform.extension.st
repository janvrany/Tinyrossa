Extension { #name : #OSPlatform }

{ #category : #'*Tinyrossa-Compat-Pharo' }
OSPlatform >> getEnvironment: name [
	^ self environment at: name ifAbsent: nil
	
	"
	Smalltalk os getEnvironment:'HOME'
	Smalltalk os getEnvironment:'bogus'
	"
]
