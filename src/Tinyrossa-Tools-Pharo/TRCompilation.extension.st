Extension { #name : #TRCompilation }

{ #category : #'*Tinyrossa-Tools-Pharo' }
TRCompilation >> gtInspectorANFIn: composite [
	<gtInspectorPresentationOrder: 35>

	| printer |

	composite tree
		title: 'ANF';
		rootsExpanded;
		display: [ :comp |
			| nodes |

			printer := TRANFNodePrinter new.
			nodes := OrderedCollection new.
			comp cfg treetops do:[:treetop |
				treetop postorderDo: [ :node |
					(nodes includes: node) ifFalse:[
						nodes add: node
					]
				]
			].
			nodes.
		];
		children: [ :node | #() ];
		format: [ :node | printer print: node ];
		yourself.

]

{ #category : #'*Tinyrossa-Tools-Pharo' }
TRCompilation >> gtInspectorTRILIn: composite [
	<gtInspectorPresentationOrder: 35>

	| printer |

	composite tree
		title: 'TRIL';
		rootsExpanded;
		display: [ :comp | printer := TRILNodePrinter new. comp cfg treetops ];
		children: [ :node | node children ];
		format: [ :node | printer print: node ];
		yourself.

]
