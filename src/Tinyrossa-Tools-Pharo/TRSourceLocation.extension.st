Extension { #name : #TRSourceLocation }

{ #category : #'*Tinyrossa-Tools-Pharo' }
TRSourceLocation >> gtDisplayOn: aStream [
	file printOn:aStream.
	aStream nextPutAll:':'.
	line printOn:aStream.
	(column notNil and: [column ~= 0]) ifTrue:[
			aStream nextPutAll:':'.
			column printOn:aStream.
	].
]
