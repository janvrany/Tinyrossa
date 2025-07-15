Extension { #name : #Array }

{ #category : #'*Interfaces' }
Array >> asInterfaceComposition [
	| composition |

	composition := InterfaceComposition new: self size.
	1 to: self size do: [:i | 
		| interface |

		interface := self at: i.
		interface isSymbol ifTrue: [ interface := Smalltalk at: interface ].
		composition at: i put: interface 
	].
	^ composition


	"Created: / 21-07-2025 / 16:31:23 / Jan Vrany <jan.vrany@labware.com>"
]
