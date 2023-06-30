Extension { #name : #TRSourceLocation }

{ #category : #'*Tinyrossa-Tools-Pharo' }
TRSourceLocation >> gtDisplayOn: aStream [
	file printOn:aStream.
	aStream nextPutAll:':'.
	line printOn:aStream.
	column notNil ifTrue:[
			aStream nextPutAll:':'.
			column printOn:aStream.
	].
]
