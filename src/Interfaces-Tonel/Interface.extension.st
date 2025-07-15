Extension { #name : #Interface }

{ #category : #'*Interfaces-Tonel' }
Interface class >> asClassDefinition [
	self == Interface ifTrue: [ 
		^ super asClassDefinition
	].

	^ MCInterfaceDefinition
		name: self name
		interfaceComposition: composition asString
		category: self category  
		comment: self organization classComment
]
