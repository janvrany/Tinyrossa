Extension { #name : #TonelParser }

{ #category : #'*Interfaces-Tonel' }
TonelParser >> definitionForType: aString [ 
	aString = TonelWriter classLabel ifTrue: [ ^ MCClassDefinition ].
	aString = TonelWriter traitLabel ifTrue: [ ^ MCTraitDefinition ].   
	aString = TonelWriter extensionLabel ifTrue: [ ^ nil ].
	aString = TonelWriter interfaceLabel ifTrue: [ ^ MCInterfaceDefinition ].
	
	TonelParseError signal: 'Unknown type declaration.'

	"Modified: / 22-07-2025 / 14:39:20 / Jan Vrany <jan.vrany@labware.com>"
]

{ #category : #'*Interfaces-Tonel' }
TonelParser >> newInterfaceDefinitionFrom: anArray [
	| metadata |

	metadata := anArray sixth.
	^ MCInterfaceDefinition
		name: (metadata at: #name)
		interfaceComposition: (metadata at: #implements ifAbsent: [ '' ])
		category: (metadata at: #category)
		comment: (anArray second ifNil: [ '' ])

	"Created: / 22-07-2025 / 14:47:37 / Jan Vrany <jan.vrany@labware.com>"
]

{ #category : #'*Interfaces-Tonel' }
TonelParser >> newTypeDefinitionFrom: anArray [
	| typeClass |
	
	typeClass := self definitionForType: anArray fourth.
	typeClass = MCClassDefinition ifTrue: [ ^ self newClassDefinitionFrom: anArray ].
	typeClass = MCTraitDefinition ifTrue: [ ^ self newTraitDefinitionFrom: anArray ].   
	typeClass = MCInterfaceDefinition ifTrue: [ ^ self newInterfaceDefinitionFrom: anArray ].   
	"is extension, no type"
	^ nil

	"Modified: / 22-07-2025 / 14:45:56 / Jan Vrany <jan.vrany@labware.com>"
]

{ #category : #'*Interfaces-Tonel' }
TonelParser >> type [
	self try: [ self word: 'Class' ] onSuccess: [ :word | ^ word  ].
	self try: [ self word: 'Trait' ] onSuccess: [ :word | ^ word  ].
	self try: [ self word: 'Extension' ] onSuccess: [ :word | ^ word  ].
	self try: [ self word: 'Interface' ] onSuccess: [ :word | ^ word  ].
	
	"at end"
	TonelParseError signal: 'Can''t parse type.'

	"Modified: / 22-07-2025 / 14:38:47 / Jan Vrany <jan.vrany@labware.com>"
]
