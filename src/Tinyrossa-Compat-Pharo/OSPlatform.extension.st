Extension { #name : #OSPlatform }

{ #category : #'*Tinyrossa-Compat-Pharo' }
OSPlatform >> getEnvironment: value [
	^self environment at: value ifAbsent:[nil]
]

{ #category : #'*Tinyrossa-Compat-Pharo' }
OSPlatform >> setEnvironment: name to: value [
	self environment at: name put: value
]
