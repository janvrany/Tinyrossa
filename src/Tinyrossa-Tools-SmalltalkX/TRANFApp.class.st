Class {
	#name : #TRANFApp,
	#superclass : #TRILTreeApp,
	#category : #'Tinyrossa-Tools-SmalltalkX'
}

{ #category : #'change & update-delayed' }
TRANFApp >> delayedUpdateInternalList [
	| nodes |

	nodePrinter := TRANFNodePrinter new.
	self nodeListHolder value isNil ifTrue: [ 
		nodes := #()
	] ifFalse: [ 
		nodes := OrderedCollection new.
		self nodeListHolder value do: [:treetop | 
			treetop postorderDo: [:node | 
				(nodes includes: node) ifFalse: [
					nodes add: node 
				].
			]
		]
	].
	self internalListHolder roots: nodes .
	self internalListHolder root recursiveDo: [ :item | item expand ]

]

{ #category : #'aspects-private' }
TRANFApp >> internalListHolder [
	"return/create the 'listHolder' value holder (automatically generated)"

	internalListHolder isNil ifTrue:[
		internalListHolder := super internalListHolder.
		internalListHolder childBlock: [ :node | #() ].
	].
	^ internalListHolder

	"Created: / 20-09-2014 / 23:03:07 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 06-06-2017 / 23:33:07 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
