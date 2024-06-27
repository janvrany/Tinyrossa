Extension { #name : #TRRuntimeConfig }

{ #category : #'*Tinyrossa-POWER' }
TRRuntimeConfig class >> forPPC64Linux [
	^ self forTarget: TRPPC64Linux default
]
