Extension { #name : #TRBytecodeLocation }

{ #category : #'*Tinyrossa-Tools-Pharo' }
TRBytecodeLocation >> gtDisplayOn: aStream [
	aStream nextPutAll: 'bci: '.
	index printOn: aStream
	
]
