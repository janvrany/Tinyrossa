Extension { #name : #ProcessorInstruction }

{ #category : #'*Tinyrossa' }
ProcessorInstruction >> replaceVirtualRegistersUsing: replacementMap [
	| updated |

	replacementMap keysAndValuesDo: [ :name :vreg |
		self assert: name isString.
		self assert: vreg isTRVirtualRegister
	].

	replacementMap isEmpty ifTrue: [ ^ self ].

	updated := self inEnvironment: replacementMap.
	self dependencies notNil ifTrue: [
		updated dependencies: (self dependencies replaceVirtualRegistersUsing: replacementMap)
	].
	^ updated
]
