Extension { #name : #TonelReader }

{ #category : #'*Interfaces-Tonel' }
TonelReader class >> definitionOrders [
		"Used to sort definitions inside a snapshot"
		^ Dictionary newFromPairs: { 
				MCOrganizationDefinition.       0.
				MCMethodDefinition.                     1.
				MCClassDefinition.                      2.
				MCTraitDefinition.                      2.
				MCClassTraitDefinition.                 3.
				MCInterfaceDefinition.                  4 }

	"Modified: / 04-06-2019 / 12:07:07 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 22-07-2025 / 17:14:20 / Jan Vrany <jan.vrany@labware.com>"
]
