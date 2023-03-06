Extension { #name : #Integer }

{ #category : #'*Tinyrossa-Compat-Pharo' }
Integer >> bitTest: bitMask [
	^(self bitAnd: bitMask) ~= 0
]

{ #category : #'*Tinyrossa-Compat-Pharo' }
Integer >> printLeftPaddedWith: aCharacter to: anInteger base: aRadix [ 
	^ self printPaddedWith: aCharacter to: anInteger base: aRadix 

]
