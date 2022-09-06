Extension { #name : #Integer }

{ #category : #'*Tinyrossa-Compat-Pharo' }
Integer >> bitTest: bitMask [
	^(self bitAnd: bitMask) ~= 0
]
