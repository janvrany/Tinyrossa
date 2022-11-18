Extension { #name : #TRCompilationConfig }

{ #category : #'*Tinyrossa-POWER' }
TRCompilationConfig class >> forPPC64Linux [
	^ self forTarget: TRPPC64Linux default
]
