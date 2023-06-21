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

	| printer builder |
	
	builder := [ :node | 
		| printed |
		
		printed := printer hasPrinted: node.
		{ node. 
			printer print: node.
			printed ifTrue:[ #() ] ifFalse: [ node children collect: builder ] }
	].

	composite fastTreeTable 
		title: 'TRIL';
		rootsExpanded;
		display: [ :comp | printer := TRILNodePrinter new. comp cfg treetops collect: builder ];
		children: [ :item | item third ];		
		column: 'Node' evaluated: [ :item | item second ];
		column: 'ID' evaluated: [ :item | printer printId: item first ];
		yourself.

]
