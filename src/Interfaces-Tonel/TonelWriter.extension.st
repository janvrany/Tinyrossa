Extension { #name : #TonelWriter }

{ #category : #'*Interfaces-Tonel' }
TonelWriter class >> interfaceLabel [
	^ 'Interface'

	"Created: / 22-07-2025 / 14:15:47 / Jan Vrany <jan.vrany@labware.com>"
]

{ #category : #'*Interfaces-Tonel' }
TonelWriter >> isInterface: aClassDefinition [
	^ aClassDefinition class = MCInterfaceDefinition

	"Created: / 22-07-2025 / 14:14:30 / Jan Vrany <jan.vrany@labware.com>"
]

{ #category : #'*Interfaces-Tonel' }
TonelWriter >> typeDefinitionOf: aClassDefinition [
	(self isTrait: aClassDefinition) 
		ifTrue: [ ^ self typeTraitDefinitionOf: aClassDefinition ].
	(self isInterface: aClassDefinition)
		ifTrue: [ ^ self typeInterfaceDefinitionOf: aClassDefinition ].
	^ self typeClassDefinitionOf: aClassDefinition

	"Modified: / 22-07-2025 / 14:17:37 / Jan Vrany <jan.vrany@labware.com>"
]

{ #category : #'*Interfaces-Tonel' }
TonelWriter >> typeInterfaceDefinitionOf: aClassDefinition [
	| definition |
	
	definition := OrderedDictionary new 
		at: #name put: aClassDefinition className; 
		yourself.

	aClassDefinition hasInterfaceComposition ifTrue: [ 
		definition              
			at: #implements
			put: aClassDefinition interfaceCompositionString ].

	definition at: #category put: aClassDefinition category asSymbol.

	^ self toSTON: definition

	"Created: / 22-07-2025 / 14:20:12 / Jan Vrany <jan.vrany@labware.com>"
]

{ #category : #'*Interfaces-Tonel' }
TonelWriter >> typeOf: aClassDefinition [
	(self isClass: aClassDefinition) ifTrue: [ ^ self class classLabel ].
	(self isTrait: aClassDefinition) ifTrue: [ ^ self class traitLabel ].
	(self isInterface: aClassDefinition) ifTrue: [ ^ self class interfaceLabel ].

	TonelShouldIgnore signal

	"Modified: / 22-07-2025 / 14:13:57 / Jan Vrany <jan.vrany@labware.com>"
]
